// SPDX-License-Identifier: MIT

//상태 변수를 쓰거나 업데이트하려면 트랜잭션을 보내야 합니다.

//반면에 거래 수수료 없이 무료로 상태 변수를 읽을 수 있습니다.
pragma solidity ^0.8.13;

contract SimpleStorage {
    // State variable to store a number
    uint public num;

    // You need to send a transaction to write to a state variable.
    function set(uint _num) public {
        num = _num;
    }

    // You can read from a state variable without sending a transaction.
    function get() public view returns (uint) {
        return num;
    }
}