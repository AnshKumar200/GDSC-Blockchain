require("dotenv").config()
require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-ethers");

const SEPOLIA_API_KEY = process.env.SEPOLIA_API_KEY;
const PRIVATE_KEY_ME = process.env.PRIVATE_KEY;

module.exports = {
  solidity: "0.8.20",
  networks: {
    hardhat: {},
    sepolia: {
      url: `${SEPOLIA_API_KEY}`,
      accounts: [`${PRIVATE_KEY_ME}`],
    },
  },
};
