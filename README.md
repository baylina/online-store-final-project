# OnlineShop - Final Project

## What does your project do?
This DApp represents a basic online marketplace where users can sell and buy all kind of articles. Any user with enought ether assoociated to a Metamask account can publish (sell) any article.

Articles offered for sale have a:
- short title
- description
- price (in ether)

A seller of an article is not allowed to buy its own published items.

You can [watch this video](https://youtu.be/9ZA30pHDypU) for a brief explanation about this final project

[![Watch the video](https://i9.ytimg.com/vi/9ZA30pHDypU/mqdefault.jpg?sqp=COD_gdwF&rs=AOn4CLDbUQOruYncOA4-fY1GQV6WqtJ4Hw&time=1535148260757)](https://youtu.be/9ZA30pHDypU)







## Installation. How to test it and set it up

1. Install Truffle globally (if not installed).
    ```javascript
    npm install -g truffle
    ```
2. Open Terminal. Change the current working directory to the location where you want the cloned directory to be made and then clone clone the project.
    ```javascript
    git clone https://github.com/baylina/online-store-final-project.git
    ```
3. from your local folder install all the node modules dependencies (some warnings might appear)
    ```javascript
    npm install
    ```
4. Launch the tests
    ```javascript
    truffle test
    ```
5. Start ganache-cli to run on port 8545
    ```javascript
    ganache-cli
    ```
6. Compile and migrate the contract over a network called ***ganache***
    ```javascript
    truffle migrate --compile-all --reset --network ganache
    ```
7. Run the `liteserver` development server (outside the development console) for front-end hot reloading. Smart contract changes must be manually recompiled and migrated.
    ```javascript
    // Serves the front-end on http://localhost:3000
    npm run start
    ```
8. Contract has been deployed to Rinkeby test network at address: [***0x75A83A845dCd006887e9cb8aB8cFCb536cdE7375***](https://rinkeby.etherscan.io/address/0x75a83a845dcd006887e9cb8ab8cfcb536cde7375) and you can interact with at
https://baylina.github.io/online-store-final-project/





Emergency stop is based in [Franz Volland  Contract](https://fravoll.github.io/solidity-patterns/emergency_stop.html).
This Dapp has been built on top of a prebuilt truffle box [pet-shop-box](https://github.com/truffle-box/pet-shop-box).
This DApp has been based from this ["ChainList" Coursera example](https://www.udemy.com/getting-started-with-ethereum-solidity-development/).
_toUpper function in ***Strings*** Library is a modification of [this function]
(https://gist.github.com/ottodevs/c43d0a8b4b891ac2da675f825b1d1dbf).
