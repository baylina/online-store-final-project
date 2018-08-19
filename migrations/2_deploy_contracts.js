var OnlineShop = artifacts.require("./OnlineShop.sol");

//var Ownable = artifacts.require("./Ownable.sol");
//var Strings = artifacts.require("./Strings.sol");

module.exports = function(deployer) {
  deployer.deploy(OnlineShop);

  //deployer.deploy(Ownable);
  //deployer.deploy(Strings);
}
