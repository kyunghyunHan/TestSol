//try / catch외부 함수 호출 및 계약 생성의 오류만 잡을 수 있습니다.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Foo{

    address public owner;

    constructor (address _owner){
        require(_owner != address(0),"invelid address");
        assert(_owner != 0x0000000000000000000000000000000000000001);
        owner = _owner;
    }
    function myFunc(uint x)public pure returns (string memory){
        require(x != 0,"require falied");
        return "my func was called";
    }
}
contract Bar{
    event Log(string message);
    event LogBytes(bytes data);

    Foo public foo;

    constructor(){
        foo =new Foo(msg.sender);
    }

    function tryCatchExiternalCall(uint _i)public {
        try foo.myFunc(_i) returns (string memory result){
            emit Log(result);

        }catch {
            emit Log("external call failed");
        }
    }
    function tryCatchNewContract(address _owner)public{
        try new Foo(_owner)returns (Foo foo){
            emit Log("Foo created");
        }catch Error(string memory reason){
            emit Log(reason);
        }catch (bytes memory reason){
            emit LogBytes(reason);
        }
    }
}