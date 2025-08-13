// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface IERC721 {
    function safeTransferFrom(address from, address to, uint256 token_id)
        external;
    function transferFrom(address, address, uint256) external;
}
contract Auction {
    //event 특정한 동작이 발생하면 event 발생->로그 기록
    event Start();
    event Bid(address indexed sender, uint256 amount);
    event Withdraw(address indexed bidder, uint256 amount);
    event End(address winner, uint amount);

    IERC721 public nft;
    uint256 public nft_id;

    address payable public seller; //NFT 판매자
    uint256 public end_at;   //경매 종료 시간
    bool public started;  //경매 시작 여부
    bool public ended;  //경매 종료 여부

    address public highest_bidder; //최고 입찰자
    uint256 public highest_bid;  //최고 입찰 금액
    mapping(address => uint256) public bids;  //돌려줄 금액 기록


    constructor(address _nft, uint256 _nft_id, uint256 _starting_bid) {
        nft = IERC721(_nft);  //경매할 NFT 주소
        nft_id = _nft_id;  

        seller = payable(msg.sender); //판매자는 배포자
        highest_bid = _starting_bid;
    }

    function start() external {
        require(!started, "started");
        require(msg.sender == seller, "not seller");

        nft.transferFrom(msg.sender, address(this), nft_id);
        
        started = true;
        end_at = block.timestamp + 7 days;

        emit Start();
    }
}


