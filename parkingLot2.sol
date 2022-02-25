//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract Ownable {

  address payable public owner;

  constructor() {
    // owner of contract who deployed the contract
    owner = msg.sender;
  }

  modifier checkOwnership {
    require(msg.sender == owner);
    _;
  }

}

contract  ParkingLot is Ownable{


  enum LotStatuses { VACANT, FULL }
  LotStatuses public currentStatuses;

  // event declaration
  event Occupy(address _occupant, uint _value);

  constructor() {
    super;
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

  function park() payable external checkVacancy checkCost(10 ether){
    currentStatuses = LotStatuses.FULL;
    // owner of contract who deployed the contract will receive eth
    owner.transfer(msg.value);
    // client who is sending eth
    emit Occupy(msg.sender, msg.value);
  }

  function markAvailable() external checkOwnership {
    currentStatuses = LotStatuses.VACANT;
  }

}