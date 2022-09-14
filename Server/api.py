from flask import Flask, request, jsonify
from main import *
from printcolor import *
app = Flask(__name__)


@app.route('/g_code', methods=['POST'])
def hello_world():
    if request.method == "POST":

        request.files['media'].save(os.getcwd() + '\\' + request.files['media'].filename)
        g_code = MyEffect()

        current_dir = os.getcwd()
        full_path = "{}\{}".format(current_dir, request.files['media'].filename)

        tempFileName = f"{request.files['media'].filename.split('.')[0]}.svg"
        asyncio.set_event_loop(asyncio.ProactorEventLoop())
        try:
            value = asyncio.get_event_loop().run_until_complete(doTrace(full_path.replace("\\", "/"), "posterized1"))
        except ConnectionResetError:
            value = asyncio.get_event_loop().run_until_complete(doTrace(full_path.replace("\\", "/"), "posterized1"))
        except Exception:
            return jsonify({
                'fileName': 'None',
                'contents': 'something went wrong',
                'length': 0
            })
        Path(tempFileName).write_text(value, encoding="utf-8")

        g_code.affect([tempFileName])
        gcodeList = g_code.output()
        os.remove(tempFileName)
        content = gcodeList

        data = {
            'fileName': request.files['media'].filename,
            'contents': content,
            'length': len(content)
        }
        os.remove(full_path)
        return jsonify(data)
    return jsonify({
        'fileName': 'None',
        'contents': 'something went wrong',
        'length': 0
    })


# main driver function
if __name__ == '__main__':
    app.run()
