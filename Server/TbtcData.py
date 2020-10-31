import json
from RequestProvider import RequestProvider


class TbtcData:
    def __init__(self,):
        self.supply = ''
        self.holders = ''
        self.minted = ''
        self.burned = ''
        self.deposit = ''
        self.value = ''
        self.price_list = []
        self.json_response = ''




    def toJSON(self):
        self.json_response = ''
        self.json_response = json.dumps(self, default=lambda o: o.__dict__,
                          sort_keys=True, indent=4)

    def update_data(self):
        url = 'https://api.thegraph.com/subgraphs/name/suntzu93/tbtc'
        request_data = '{"query":"{tbtctokens{id,name,address,totalMint,totalBurn,totalSupply,currentTokenHolders}}","variables":null}'

        result = RequestProvider.post_request(url, request_data)

        if result is not None:
            result = result['data']['tbtctokens'][0]
            self.holders = result['currentTokenHolders']
            self.burned = result['totalBurn']
            self.minted = result['totalMint']
            self.supply = result['totalSupply']

        request_data_deposit = '{"query":"{totalBondedECDSAKeeps{totalKeepActive}}","variables":null}'
        deposit_result = RequestProvider.post_request(url, request_data_deposit)
        if deposit_result is not None:
            self.deposit = deposit_result['data']['totalBondedECDSAKeeps'][0]['totalKeepActive']

        url_price = 'https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=1d&limit=7'
        price_result = RequestProvider.get_request(url_price)
        if price_result is not None:
            for item in price_result:
                self.price_list.append({'time': item[0],
                                        'price': item[4]})

        self.normalize_data()
        self.toJSON()

    def normalize_data(self):
        self.supply = self.correct_round(self.supply, 0)
        self.holders = self.correct_round(self.holders, 0)
        self.minted = self.correct_round(self.minted, 0)
        self.burned = self.correct_round(self.burned, 0)
        self.deposit = self.correct_round(self.deposit, 0)
        self.value = str(int(round(float(self.price_list[-1]['price']) * int(self.supply), 0)))[:2] + 'M'


    def correct_round(self, text, round_size):
        num = round(float(text), round_size)
        if round_size == 0:
            return str(int(num))
        else:
            return str(num)


