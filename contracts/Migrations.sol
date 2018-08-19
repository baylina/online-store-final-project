pragma solidity ^0.4.23;

/** @dev The Migrations.sol contract is required by the “truffle migrate”
  * command. Every time a migration step is completed successfully,
  * “setCompleted” function is triggered to update the last_completed_migration
  * number. In our case, “setCompleted” runs 2 times because thear are
  * 2 deployment files in migrations folder:
  *     -> 1_initial_migration.js
  *     -> 2_deploy_contracts.js
  * They were executed in sequential order.
  */
contract Migrations {
  address public owner;

  // A function with the signature `last_completed_migration()`, returning a uint, is required.
  uint public last_completed_migration;

  // Onliy the owner of the contract will be able to execute functions where this modifier is applied
  modifier restricted() {
    if (msg.sender == owner) _;
  }

  // Constructor function sets the owner of the contract to msg.sender
  constructor() public {
    owner = msg.sender;
  }

  // A function with the signature `setCompleted(uint)` is required.
  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  // upgrades the address where the contract has been migrated
  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}
