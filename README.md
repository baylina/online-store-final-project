# OnlineShop - Final Project

## What does your project do?
This DApp represents a basic online marketplace where users can sell and buy all kind of articles. Any user with enought ether assoociated to a Metamask account can publish (sell) any article.

Articles offered for sale have a:
- short title
- description
- price (in ether)

A seller of an article is not allowed to buy its own published items.


## Installation. How to test it and set it up

1. Install Truffle globally (if not installed).
    ```javascript
    npm install -g truffle
    ```
2. Unzip the file onlineShop.zip in your destination folder of your local machine
    ```javascript
    unzip onlineShop.zip -d destination_folder
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
    npm run dev
    ```
8. Contract has been deployed to Rinkeby test network at address: ***0x8ef566f9896372A12b12913439AcE81419244652***


Emergency stop is based in [Franz Volland  Contract](https://fravoll.github.io/solidity-patterns/emergency_stop.html).
This Dapp has been built on top of a prebuilt truffle box [pet-shop-box](https://github.com/truffle-box/pet-shop-box).
This DApp has been based from this ["ChainList" Coursera example](https://www.udemy.com/getting-started-with-ethereum-solidity-development/).
_toUpper function in ***Strings*** Library is a modification of [this function]
(https://gist.github.com/ottodevs/c43d0a8b4b891ac2da675f825b1d1dbf).
