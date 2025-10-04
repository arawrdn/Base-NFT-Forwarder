// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract BadgeForwarder {
    address payable public owner;
    // Minimal deposit fee: 0.000001 ETH (1,000,000,000,000 Wei)
    uint public constant MINIMUM_DEPOSIT = 1000000000000; 

    // --- NFT STATE VARIABLES (Minimal ERC-721) ---
    uint256 private _nextTokenId;
    mapping(uint256 => address) private _owners; // tokenId -> ownerAddress
    mapping(address => uint256) private _balances; // ownerAddress -> tokenCount

    // NFT Metadata On-Chain
    string public name = "UserParticipationBadge";
    string public symbol = "UPB";

    // ERC-721 Event (Penting untuk explorer/wallet NFT)
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    // Forwarding Event
    event FundsForwarded(address indexed sender, uint amount);

    // --- CONSTRUCTOR ---
    constructor() {
        owner = payable(msg.sender);
        _nextTokenId = 1; // NFT ID dimulai dari 1
    }

    // --- RECEIVE FUNCTION (DEPOSIT, MINT & FORWARD OTOMATIS) ---
    receive() external payable {
        // 1. Requirement check: Pastikan deposit minimal terpenuhi.
        require(msg.value >= MINIMUM_DEPOSIT, "Deposit must be 0.000001 ETH or higher to receive a badge.");
        
        // 2. Mint NFT: Ciptakan badge dan kirim ke pengirim (User).
        _mint(msg.sender);
        
        // 3. Forward Dana: Teruskan dana yang diterima secara instan ke owner.
        (bool success, ) = owner.call{value: msg.value}("");
        require(success, "Forwarding failed.");

        emit FundsForwarded(msg.sender, msg.value);
    }
    
    // --- MINTING LOGIC (Internal) ---
    function _mint(address to) internal {
        uint256 tokenId = _nextTokenId;
        _nextTokenId++;

        _owners[tokenId] = to;
        _balances[to]++;
        
        // address(0) digunakan sebagai alamat 'from' untuk minting
        emit Transfer(address(0), to, tokenId);
    }
    
    // --- VIEW FUNCTIONS ERC-721 (Minimal) ---
    function balanceOf(address ownerAddress) public view returns (uint256) {
        return _balances[ownerAddress];
    }
    
    function ownerOf(uint256 tokenId) public view returns (address) {
        require(_owners[tokenId] != address(0), "ERC721: invalid token ID");
        return _owners[tokenId];
    }
    
    // Fungsi ini menyediakan deskripsi badge yang diminta.
    function getTokenDescription() public pure returns (string memory) {
        return "User Participation Badge with a bright yellow background.";
    }
}
