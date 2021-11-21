/*
	Что проверяем:
	1. прием пожертвований 
	2. фиксация адресов донатеров и суммы их пожертвований
	3. вывод средств 
	4. проверка адреса создателя
*/

const { expect, use } = require ("chai");
const { Contract } = require ("ethers");
const { deployContract, MockProvider, solidity } = require ("ethereum-waffle");


describe("Funding contract", function () {
  let Funding;
  let hardhatFunding;
  let owner;
  let addr1;
  let addr2;
  let addrs;
  let bOwner;
  let bAddr1;
  let bAddr2;



  beforeEach(async function () {
    Funding = await ethers.getContractFactory("Funding");
    [owner, addr1, addr2, ...addrs] = await ethers.getSigners();
    hardhatFunding = await Funding.deploy();
  });

  describe("Deployment", function () {
    it("Should set the right owner", async function () {
      expect(await hardhatFunding.owner()).to.equal(owner.address);
    });
  });


});