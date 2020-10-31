import requests
import asyncio

from aiohttp import ClientSession


class Wallet:

    def get_balance(self, address):
        keep_contract = '0x85eee30c52b0b379b046fb0f85f4f3dc3009afec'
        tbtc_contract = '0x8dAEBADE922dF735c38C80C7eBD708Af50815fAa'

        keep = requests.get('https://api.tokenbalance.com/balance/' + keep_contract + "/" + address)
        tbtc = requests.get('https://api.tokenbalance.com/balance/' + tbtc_contract + "/" + address)
        print(keep.text, tbtc.text)



w = Wallet()
w.get_balance('0xe3E3aD5715c4A61A559D3ef6C8D28e440255A6a5')