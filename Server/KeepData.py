import json
from RequestProvider import RequestProvider
from server_settings import *

class KeepData:
    def __init__(self,):
        self.supply = ''
        self.holders = ''
        self.stakers = ''
        self.staked = ''
        self.price = ''
        self.cap = ''
        self.price_list = []
        self.json_response = ''




    def toJSON(self):
        self.json_response = ''
        self.json_response = json.dumps(self, default=lambda o: o.__dict__,
                          sort_keys=True, indent=4)

    def update_data(self):
        url = 'https://api.thegraph.com/subgraphs/name/suntzu93/keepnetwork'
        request_data = '{"query":"{tokenStakings{totalStaker, totalTokenStaking}}","variables":null}'
        result = RequestProvider.post_request(url, request_data)

        if result is not None:
            result = result['data']['tokenStakings'][0]
            self.stakers = result['totalStaker']
            self.staked = result['totalTokenStaking']

        url = 'https://api.thegraph.com/subgraphs/name/suntzu93/keepnetwork'
        request_data = '{"query":"{governances{totalTokenHolders}}","variables":null}'
        result = RequestProvider.post_request(url, request_data)

        if result is not None:
            result = result['data']['governances'][0]
            self.holders = result['totalTokenHolders']

        url_price = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=KEEP&convert=USD'
        price_headers = {
            'Accepts': 'application/json',
            'X-CMC_PRO_API_KEY': SMS_TOKEN,
        }

        price_result = RequestProvider.get_request(url_price, price_headers)

        if price_result is not None:
            price_result = price_result['data']['KEEP']
            self.price = price_result['quote']['USD']['price']
            self.supply = price_result['circulating_supply']
            self.cap = price_result['quote']['USD']['market_cap']

        url_price_list = 'https://api.hoolgd.com/open/v1/kline/market?symbol=KEEP-USDT&type=1Day'
        price_list_result = RequestProvider.get_request(url_price_list)

        if price_list_result is not None:
            price_list_result = price_list_result['data'][-7:]
            for item in price_list_result:
                self.price_list.append({'time': item['time'] * 1000,
                                        'price': item['close']})


        self.normalize_data()
        self.toJSON()

    def normalize_data(self):
        self.supply = str(int(self.supply))[:3] + 'M'
        self.holders = self.holders
        self.stakers = self.stakers
        self.staked = str(int(self.staked[:self.staked.find('.')]))[:2] + 'M'
        self.price = str(self.price)[:4]
        self.cap = str(int(self.cap))[:2] + 'M'
