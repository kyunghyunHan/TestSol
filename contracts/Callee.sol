
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
//Contract는 2가지 방식으로 다른 Contract를 호출할 수 있습니다.

//가장 쉬운 방법은 처럼 그냥 호출하는 것 A.foo(x, y, z)입니다.

//다른 계약을 호출하는 또 다른 방법은 낮은 수준을 사용하는 것 call입니다.

//이 방법은 권장되지 않습니다.
contract Callee {
    uint public x;
    uint public value;

    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns (uint, uint) {
        x = _x;
        value = msg.value;

        return (x, value);
    }
}
contract Caller {
    function setX(Callee _callee, uint _x) public {
        uint x = _callee.setX(_x);
    }

    function setXFromAddress(address _addr, uint _x) public {
        Callee callee = Callee(_addr);
        callee.setX(_x);
    }

    function setXandSendEther(Callee _callee, uint _x) public payable {
        (uint x, uint value) = _callee.setXandSendEther{value: msg.value}(_x);
    }
}