///불변 변수는 상수와 같습니다. 불변 변수의 값은 생성자 내부에서 설정할 수 있지만 나중에 수정할 수는 없습니다.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Immutable {
    // coding convention to uppercase constant variables
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}