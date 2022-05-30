//keccak256입력의 Keccak-256 해시를 계산합니다.
//입력에서 결정적 고유 ID 만들기
//커밋-공개 방식
//컴팩트 암호화 서명(더 큰 입력 대신 해시 서명 사용)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract HashFunction {
    function hash(
        string memory _text,
        uint _num,
        address _addr
    )public pure returns (bytes32){
        return keccak256(abi.encodePacked(_text,_num,_addr));
    }

    function collision(string memory _text,string memory _anotherText)
    public
    pure
    returns (bytes32)
    {
        return keccak256(abi.encodePacked(_text,_anotherText));
    }
}
contract GuessTheMagicWord{
    bytes32 public answer = 
    0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;
    function guess(string memory _word) public view returns (bool) {
        return keccak256(abi.encodePacked(_word)) == answer;
    }
}