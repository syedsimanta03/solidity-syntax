//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract  Array {

  uint[] public numbers;

  // add elements
  constructor () {
    numbers.push(5);
    numbers.push(6);
    numbers.push(9);
  }

  // update
  function updateArray(uint _index, uint _updateValue) external {
    numbers[_index] = _updateValue;
  }

  // delete an element
  function deleteArray(uint _index) external {
    delete numbers[_index];
  }


}