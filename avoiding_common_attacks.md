- Avoiding race conditions by doing the internal work before making the external function call. In the
function *buyArticle()* we firs do all necessary jobs, even retrieving articles before calling the
*article.seller.transfer(msg.value)* function.

- In our contact Awe are not threatened with a potential cross function race conditions.

- At any moment we have handled our internal contract state changes before calling external contracts.

- Transaction ordering and Timestamp Dependence: There is no protection implemented for this threat. While transactions are in the mempool before they make it into a block, anyone can know what transactions are about to occur on the network.  So if a customers want to buy an Article someone could anticipate and try to buy it before. One possible solution would be to encrypt the data associated with any article.

- Integer Overflow and Underflow: We don't have internal arithmetic operations on integers that we should worry about. Even thou we ensure that the article price introduced by the user (seller) is a positive number *require(_price > 0)* and we limit the price for the articles to be sold by using *require(_price <= maxWeiPriceForArticle)*.

- We are not using logic that depends on the contract balance.  

- An emergency stop has been implemented to allow the contract owner to be able to stop and resume the execution of the 2 main important functions *sellArticle()* and *buyArticle()*.

- Contract uses a kill functions that can only be called from the contract owner to *selfdestruct* it and deactivate it from the blockchain.
