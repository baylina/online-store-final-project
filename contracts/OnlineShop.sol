pragma solidity ^0.4.23;

import "./Strings.sol";

// @title  OnlineShop Contract
contract OnlineShop {

  // custom types
  struct Article {
    uint id;
    address seller;
    address buyer;
    string name;
    string description;
    uint256 price;
  }

  // state variables
  address owner;
  mapping (uint => Article) public articles;
  uint articleCounter;

  // other auxiliar state variables not related to articles
  bool isStopped = false;
  uint allowedTime = 0;
  uint secondsBetweenBuys = 3;
  uint maxWeiPriceForArticle = 50000000000000000000; // 50 Ether;

  // events
  event LogSellArticle(
    uint indexed _id,
    address indexed _seller,
    string _name,
    uint256 _price
  );
  event LogBuyArticle(
    uint indexed _id,
    address indexed _seller,
    address indexed _buyer,
    string _name,
    uint256 _price
  );


  /** Onliy the owner of the contract will be able to execute functions with
    * this modifier is applied
    */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  /** @dev Mdifier to avoid execution a certain function while an
    * emergency stop
    */
  modifier stoppedInEmergency {
      require(!isStopped);
      _;
  }

  /** @dev If the function gets executed it postpone the begining for the next
    * execution to 't' seconds from now to limit the frequency on a certain
    * function execution
    * @param t number of seconds from now till function will be executable again
    */
  modifier setSpeedBumpsEvery(uint t) {
      if (now >= allowedTime) {
        _;
        allowedTime = now + t;
      }
  }

  /** Constructor function sets the owner of the contract to msg.sender
    */
  constructor() public {
    owner = msg.sender;
  }

  /** @dev call to this function will force an emmergency stop.
    * Only the owner of this contract can call this function
    */
  function stopContract() public onlyOwner {
      isStopped = true;
  }

  /** @dev call to this function will resume the emmergency stop.
    * Only the owner of this contract can call this function
    */
  function resumeContract() public onlyOwner {
      isStopped = false;
  }

  /** @dev deactivate/terminates the contract and return the funds to the owner
    */
  function kill() public onlyOwner {
    selfdestruct(owner);
  }

  /** @dev puts an article on sale and increases the storage variable 'articleCounter'
    * @param _name name of the article to be sold
    * @param _description description of the article to be sold
    * @param _price price of the article to be sold
    */
  function sellArticle(string _name, string _description, uint256 _price) public stoppedInEmergency {

    // Price must be a positive number
    require(_price > 0);

    // Price must have a maximum amount to avoid Integer Overflow attacks
    require(_price <= maxWeiPriceForArticle);

    // a new article
    articleCounter++;

    // store this article
    articles[articleCounter] = Article(
      articleCounter,
      msg.sender,
      0x0,
      Strings._toUpper(_name),
      _description,
      _price
    );

    emit LogSellArticle(articleCounter, msg.sender, _name, _price);
  }

  /** @dev fetch the number of articles in the contract
    * @return uint then total number of articles
    */
  function getNumberOfArticles() public view returns (uint) {
    return articleCounter;
  }

  /** @dev fetch and return all article IDs for articles still for sale
    * @return uint[] array of articles IDs sill for sale
    */
  function getArticlesForSale() public view returns (uint[]) {
    // prepare output array
    uint[] memory articleIds = new uint[](articleCounter);

    uint numberOfArticlesForSale = 0;
    // iterate over articles
    for(uint i = 1; i <= articleCounter;  i++) {
      // keep the ID if the article is still for sale
      if(articles[i].buyer == 0x0) {
        articleIds[numberOfArticlesForSale] = articles[i].id;
        numberOfArticlesForSale++;
      }
    }

    // copy the articleIds array into a smaller forSale array
    uint[] memory forSale = new uint[](numberOfArticlesForSale);
    for(uint j = 0; j < numberOfArticlesForSale; j++) {
      forSale[j] = articleIds[j];
    }
    return forSale;
  }

  /** @dev buy an article
    * @param _id ID of the article we are trying to buy
    */
  function buyArticle(uint _id) setSpeedBumpsEvery(secondsBetweenBuys) payable public stoppedInEmergency {
    // we check whether there is an article for sale
    require(articleCounter > 0);

    // we check that the article exists
    require(_id > 0 && _id <= articleCounter);

    // we retrieve the article
    Article storage article = articles[_id];

    // we check that the article has not been sold yet
    require(article.buyer == 0X0);

    // we don't allow the seller to buy his own article
    require(msg.sender != article.seller);

    // we check that the value sent corresponds to the price of the article
    require(msg.value == article.price);

    // keep buyer's information
    article.buyer = msg.sender;

    // the buyer can pay the seller
    article.seller.transfer(msg.value);

    // trigger the event
    emit LogBuyArticle(_id, article.seller, article.buyer, article.name, article.price);
  }
}
