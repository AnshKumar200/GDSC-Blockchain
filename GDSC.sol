// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GDSC {
    mapping(uint256 => address) private tokenOwners;
    mapping(uint256 => address) private tokenApprovals;
    mapping(address => uint256) private balances;
    mapping(address => mapping(address => bool)) private operators;

    uint256 private tokenIdCounter;

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    function balanceOf(address owner) external view returns (uint256) {
        require(owner != address(0), "Address Not Found");
        return balances[owner];
    }

    function ownerOf(uint256 tokenId) external view returns (address) {
        address owner = tokenOwners[tokenId];
        require(owner != address(0), "Invalid Token");
        return owner;
    }

    function approve(address to, uint256 tokenId) external {
        address owner = tokenOwners[tokenId];
        require(msg.sender == owner || isApprovedForAll(owner, msg.sender), "Not Approved Or Owner");

        tokenApprovals[tokenId] = to;
        emit Approval(owner, to, tokenId);
    }

    function getApproved(uint256 tokenId) external view returns (address) {
        return tokenApprovals[tokenId];
    }

    function setApprovalForAll(address operator, bool approved) external {
        require(operator != msg.sender, "Already The Owner");
        operators[msg.sender][operator] = approved;
        emit ApprovalForAll(msg.sender, operator, approved);
    }

    function isApprovedForAll(address owner, address operator) public view returns (bool) {
        return operators[owner][operator];
    }

    function _isApprovedOrOwner(address spender, uint256 tokenId) internal view returns (bool) {
        address owner = tokenOwners[tokenId];
        return (spender == owner || tokenApprovals[tokenId] == spender || isApprovedForAll(owner, spender));
    }

    function transferFrom(address from, address to, uint256 tokenId) external {
        require(_isApprovedOrOwner(msg.sender, tokenId), "Not Approved Or Owner");
        _transfer(from, to, tokenId);
    }

    function _transfer(address from, address to, uint256 tokenId) internal {
        require(tokenOwners[tokenId] == from, "Not The Owner Of This Token");
        require(to != address(0), "Cannot Transfer");

        tokenApprovals[tokenId] = address(0);
        tokenOwners[tokenId] = to;
        balances[from]--;
        balances[to]++;

        emit Transfer(from, to, tokenId);
    }
    
    function mint(address to) external {
        require(to != address(0), "Cannot Mint");

        uint256 tokenId = tokenIdCounter;
        tokenIdCounter++;

        tokenOwners[tokenId] = to;
        balances[to]++;
        
        emit Transfer(address(0), to, tokenId);
    }
}
