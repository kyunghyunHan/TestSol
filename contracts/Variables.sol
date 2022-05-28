pragma solidity ^0.8.13;
//현지의
//함수 내에서 선언
//블록체인에 저장되지 않음
//상태
//함수 외부에서 선언
//블록체인에 저장
//global (블록체인에 대한 정보 제공)
contract Variables{
    string public text ="hello";
    uint public num = 123;

    function doSomething()public {

        uint i = 456;

        uint timestamp = block.timestamp;
        address sender = msg.sender;
    }
}