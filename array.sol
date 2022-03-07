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
    function getArray() public view returns (uint) {
        return numbers[0];
    }
  // update
  function updateArray(uint _index, uint _updateValue) external {
    numbers[_index] = _updateValue;
  }

  // delete an element
  function deleteArray(uint _index) external {
    delete numbers[_index];
  }

  function getElement(uint i) public view returns(uint){
    if(i < numbers.length) {
      return numbers[i];
    }
    return 0;
  }

// memory array - push and replace values
  function f() public {
    uint[] memory y = new uint[](3);

    y[0] = 10;
    y[1] = 20;
    y[2] = 30;
    numbers = y;
    
  }

// dynamic memory array
//Creating dynamic memory arrays
//Dynamic memory arrays are created using new keyword.
uint size = 3;
/*new unit[](10) type where the unit[] must be the variable type again and the <number of elements> that will be in the array in the bracket ().*/
//assign the array to a new empty array
uint balance[] = new uint[](size);
//You can manually set the array length to 0 with
balance.length = 0;
// or
delete balance;
//or
balance = 0;

uint salary = balance[2];
