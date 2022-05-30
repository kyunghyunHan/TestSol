// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
//View함수는 상태가 변경되지 않을 것이라고 선언합니다.

//Pure함수는 상태 변수가 변경되거나 읽히지 않을 것이라고 선언합니다.

contract ViewAndPure{

    uint public x = 1;
    function addTox(uint y) public view returns (uint){
        return x + y;
    }

    function add(uint i,uint j )public pure returns (uint){
        return i+j;
    }
}