pragma solidity  ^0.8.11;

contract CPMM{

string public token0 = "myTokenA";
string public token1 = "myTokenA";

uint256 public reserve0 = 50000000;
uint256 public reserve1 = 200000000;
 // 유동성 풀에서의 token0과 token1의 reserve를 업데이트

 function _update(uint _reserve0, uint _reserve1)private {
reserve0 = _reserve0;
reserve1=_reserve1;

 }

 //문자열 비교 함수입니다

function _comparString(string memory a, string memory b) private pure returns(bool){
    if(bytes(a).length != bytes(b).length){

        return false;
    }else {
        return keccak256(bytes(a))==keccak256(bytes(b));
    }
}

//교환하고자 하는 토큰과 교환하고자 하는 수량을 입력값으로 제공하였을 시 swap이후 얻는 토큰과 해당토큰의 수량을 반환하는 함수
function swap(string memory _tokenIn,uint256 _amountIn)public returns (string memory,uint256){
    //입력한 토큰이 토큰 0 또는 토큰 1이 아닐떄 swap트랜잭션이 실행되는 것을 방지
    require(
        _comparString(_tokenIn,token0) || _comparString(_tokenIn,token1),
        "Invalid token"
    );

    //token0을 token1로 스왑할경우 isToken0이 true가되고 그 반대의 경우 false가 됩니다

    bool isToken0 = _comparString(_tokenIn, token0);
    
    //스왑하고자 하는 토큰이 무엇인지에 따라 reserve의 in,out변수에 값을 대입합니다
    (string memory tokenOut,uint256 reservIn,uint256 reserveOut)=isToken0
    ?(token1,reserve0,reserve1)
    :(token0,reserve1,reserve0);
    //거래시 liquidity pool은 0.3%의 수수료를 수취,수수료는 유동성과 풀과 무관하다고 가정
    uint amountInWithFee= (_amountIn *997)/1000;
}


}