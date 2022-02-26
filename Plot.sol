//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

import "./Ownable.sol";
import "./Pspot.sol";

// inherits from Ownable.sol
contract  ParkingLot is Ownable {

  mapping(uint => address) public spots;

  function createSpot(uint _spotId) external checkOwnership {
    Pspot spot = new Pspot(_spotId);
    spots[_spotId] = address(spot);
  }

  function parkSpotStatus(uint _spotId) external view return (bool) {
    Pspot spot = Pspot(spots[_spotId]);
    return spot.isVacant();
  }

 function takeUpSpot(unint _spotId) payable external {
    (bool success, ) = (spots[_spotId]).call{value: msg.value}(""); //address.call{ether amount}(without data)
    if(!success){
      revert("Underlying call to spot contract failed");
    }
 } 

 function freeUpSpot(unint _spotId) external checkOwnership {
    Pspot spot = Pspot(address(uint160(spots[_spotId])));
    spot.markAvailable();
 } 

}