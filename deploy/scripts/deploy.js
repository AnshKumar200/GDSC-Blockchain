const { ethers } = require("hardhat");

async function main() {
  const getcontract = await ethers.getContractFactory("GDSC");
  const deploycontract = await getcontract.deploy();
  await deploycontract.deployed();
  console.log("GDSC deployed to:", deploycontract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
