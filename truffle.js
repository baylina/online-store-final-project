module.exports = {
     // See <http://truffleframework.com/docs/advanced/configuration>
     // to customize your Truffle configuration!
     networks: {
          _ganache: {
               host: "localhost",
               port: 7545,
               network_id: "*" // Match any network id
          },
          ganache: {
            host: "localhost",
            port: 8545,
            network_id: "4224",
            gas: 4700000
          },
          rinkeby: {
            host: "localhost",
            port: 8545,
            network_id: "4",
            gas: 4700000,
            //gasPrice: 100000000000,
            from: "0x3B98D24Ca6682cB3e3d1F5BCFDddDCBEfa96DEF9"
          }
     }
};
