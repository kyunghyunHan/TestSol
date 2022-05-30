
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
//modifier 함수 호출전후에 실행할수 있는 코드
//- 액세스 제한
//입력 확인
// 재진입 해킹으로부터 보호


contract FunctionModifier {
  address public owner;
  uint public x = 10;
  bool public locked;

  constructor(){
    owner = msg.sender;
    
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"Not owner");

        _;
    }
    
    modifier validAddress(address _addr){
        require(_addr != address(0),"Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }
  modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }


}