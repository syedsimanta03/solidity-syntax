//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

// parent contract
contract Ownable {

  address payable public owner;

  constructor() {
    // owner of contract who deployed the contract
    owner =  tx.origin;
  }

  modifier checkOwnership {
    require(tx.origin == owner);
    _;
  }

}