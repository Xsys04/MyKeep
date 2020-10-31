from flask import Flask
from loguru import logger
from server_settings import *
from TbtcData import TbtcData
from KeepData import KeepData

tbtc = TbtcData()
tbtc.update_data()

keep = KeepData()
keep.update_data()




logger.add("log/server.log", level="DEBUG", rotation="1 day")
app = Flask(__name__)

@app.route('/get_tbtc', methods=['GET', 'POST'])
@logger.catch
def get_tbtc():
    return tbtc.json_response

@app.route('/get_keep', methods=['GET', 'POST'])
@logger.catch
def get_keep():
    return keep.json_response


if __name__ == '__main__':
    app.run(host=SERVER_IP, port=SERVER_PORT, debug=False)
