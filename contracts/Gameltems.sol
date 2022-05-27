pragma solidity ^0.8.0;

import "@openzeppelin/token/ERC1155/ERC1155.sol";
contract GameItems is ERC1155{
  uint256 public constant GOLD = 0;
  uint256 public constant SILVER = 1;
  uint256 public constant THORS_HAMMER = 2;
  uint256 public constant SWORD = 3;
  uint public constant SHIELD = 4;

  constructor() public ERC1155(){

      
  }

}