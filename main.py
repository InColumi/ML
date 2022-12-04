import torch
import bentoml

path = './best.pt'

model = torch.hub.load('ultralytics/yolov5', 'custom', path=path, force_reload=True)
result = model('17.jpg')

result.show()
