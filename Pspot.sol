//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

import "./Ownable.sol";

// inherits from Ownable.sol
contract  Pspot Ownable{

  uint public spotId;

  enum LotStatuses { VACANT, FULL }
  LotStatuses public currentStatuses;

  // event declaration
  event Occupy(address _occupant, uint _value);

  constructor(uint _spotId) {
    super;
    spotId = _spotId;
    currentStatuses = LotStatuses.VACANT;
  }

  modifier checkVacancy {
    require(currentStatuses == LotStatuses.VACANT, "Currently not vacant");
    _;
  }

  modifier checkCost(uint _amount) {
        require(msg.value >= _amount, "Not enough ether provided");
    _;
  }

  function isVacant() external view returns (bool) {
    if(currentStatuses == LotStatuses.FULL) {
      return false;
    }
    else {
      return true;
    }
  }

 /*  function park() payable external checkVacancy checkCost(10 ether){
    currentStatuses = LotStatuses.FULL;
    // owner of contract who deployed the contract will receive eth
    owner.transfer(msg.value);
    // client who is sending eth
    emit Occupy(msg.sender, msg.value);
  }*/

  function markAvailable() external checkOwnership {
    currentStatuses = LotStatuses.VACANT;
  }

  receive() external payable checkVacancy checkCost(10 ether) {
    currentStatuses = LotStatuses.FULL;
    owner.transfer(msg.value);
    emit Occupy(msg.sender, msg.value);
  }

}