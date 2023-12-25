# Google Developer Student Clubs - Blockchain Submission
My submission for Task Round implementing a basic ERC721 smart contract with functions for minting new tokens and transferring ownership.

Test URL - https://gdsc-blockchain.vercel.app/

The contract is deployed on Sepolia Testnet. Also added a basic UI for better visualization.

Check the transactions - https://sepolia.etherscan.io/address/0x40b0322Eb5664D1cc276719C5de54A1e9AFBA556

### The contract includes functions such as - 
  - balanceOf - To get the balance.
  - ownerOf - To see who is the owner of the token.
  - approve - Approves another address to transfer the token.
  - getApproved - To get the address approved for the token.
  - setApprovalForAll - To get the option to approve or deny any token they control.
  - isApprovedForAll - To check whether the address is approved.
  - transferFrom - Transfer ownership of the token to another address.
  - mint - Generates a new token and gives the address ownership of it.
