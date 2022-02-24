//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract  MappingExample{
    
    // initiate simple mapping
    mapping(string => uint) public players;

    // map data
    players['bob'] = 20;
    players['alice'] = 50;
    players['moon'] = 10;

    // read 
    function getScore(string memory _player) external view returns(uint) {
        return players[_player];
    }

    // update 
    function updateScore(string memory _player, uint _score) external {
        players[_player] = _score;
    }
    
    // delete
    function deletePlayer(string memory _player) external {
        delete players[_player];
    }
}
