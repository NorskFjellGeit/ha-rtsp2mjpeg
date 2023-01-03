import io
import rtsp
import time
import asyncio
from PIL import Image, ImageMode
from flask import Flask, Response, redirect, url_for, render_template

loop = asyncio.get_event_loop()
client = rtsp.Client(rtsp_server_uri='rtsp://10.0.0.6:554/s0', verbose=True)
current_image = None
with io.BytesIO() as output:
  Image.new('RGB', (1920, 1080)).save(output, format="JPEG")
  current_image = output.getvalue()

async def grab_camera():
  image:Image = client.read()
  with io.BytesIO() as output:
    image.save(output, format="JPEG")
    current_image = output.getvalue()
  await asyncio.sleep(0.5)


def get_single_frame():
  image:Image = client.read()
  with io.BytesIO() as output:
    image.save(output, format="JPEG")
    return output.getvalue()

def get_last_frame():
  while True:
    image:Image = client.read()
    with io.BytesIO() as output:
      image.save(output, format="JPEG")
      yield (b'--frame\r\n'
              b'Content-Type: image/jpeg\r\n\r\n' + output.getvalue() + b'\r\n')
    time.sleep(0.5)

app = Flask(__name__)

@app.before_first_request
def fetch_images():
  loop.run_until_complete(grab_camera())

@app.route('/')
def root():
    return render_template("index.html")

@app.route("/still")
def still_image():
  return Response(get_single_frame(), mimetype='image/jpeg')

@app.route('/stream')
def stream_images():
  return Response(get_last_frame(), mimetype='multipart/x-mixed-replace; boundary=frame')


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8090)
