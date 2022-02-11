//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract FirstContract {
    
    struct Player {
        string name;
        uint score;
    }

    // create structs
    Player public bob = Player('Bob', 10);
    Player public rasel = Player('Rasel', 20);
    Player public tor = Player({score: 25, name: 'Tor'});

    // update struct
    function updateBob(uint _score) external {
        bob.score = _score;
    }
    // read
    function readbob() external view returns(uint) {
        return bob.score;
    }

    function deleteRasel() external {
        delete rasel;
    }
}
