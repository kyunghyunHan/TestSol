// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


interface IERC721{

}

contract Auction{
    //event 특정한 동작이 발생하면 event 발생->로그 기록
    event Start();
    event Bid(address indexed sender , uint256 amount);
}
