

Предлагается выполнять данную лабораторную работу в группах из 1-5 человек. Каждая группа, выполняющая лабораторную работу выбирает свой вариант. В соответствии с выбранным вариантом необходимо будет работать с определенными видами объектов. Также проект необходимо вести в открытом GitHub репозитории (при желании можно воспользоваться сервисом GitLab).

1. Необходимо взять за основу готовую реализацию приложения для Android/iOS с задачей детекции объектов (в лекции 3 можно найти ссылки на соответсвующие репозитории)

2. По инструкции, описанной в лабораторной работе 0.3 обучить собственную модель YOLOv5. Классы выбираются в соответствии с выбранным вариантом. Списки наименований классов представлены ниже в описании лабораторной работы. При желании можно воспользоваться другими архитектурами для решения задачи детекции объектов, например [YoloX](https://github.com/Megvii-BaseDetection/YOLOX) или [YOLOv7](https://github.com/WongKinYiu/yolov7).

3. Далее необходимо экспортировать модель в целевой фреймворк. Для iOS устройств следует выбирать CoreML, для Android можно воспользоваться либо Tensorflow-Lite, либо PyTorch Mobile. Экспортировать модель следует скриптом *export.py* по [следующей](https://github.com/ultralytics/yolov5/issues/251) инструкции.

4. Собрать решение и запустить на мобильном устройстве данную модель, оценить скорость работы архитектуры (добавить профилирование времени работы вызова функции с моделью)

5. Необходимо продемонстрировать работу модели на тестовых изображениях. Тестовый набор данных с разметкой будет предоставляться при сдачи задания группой. Для успешной сдачи на тестовой выборке модель должна достигать значений метрики mAP@0.9 не ниже 0.8. Значения метрики могут быть скорректированы позднее.

Наборы классов для каждого варианта:

1. зубная щетка, тюбик зубной пасты, мыло (твердое, при желании можно добавить 4-й класс с тарой жидкого мыла)
2. **кабачок, помидор, огурец**
3. денежная купюра, монета, банковская карта
4. классическая гитара, акустическая гитара, электрогитара (при желании можно добавить 4-й класс с полуакустической гитарой)

Требования к репозиторию и проводимым экспериментам:

- Проводимые эксперименты должны быть воспроизводимы, следовательно следует прикрепить ссылку на размеченный набор данных
- Репозиторий [YOLOv5](https://github.com/ultralytics/yolov5) (если выбрана другая реализация, то её репоизиторий соответственно) необходимо добавить к репозиторию в качестве submodule, про это можно почитать в данном описании.
- Код для обучения должен запускаться из Docker контейнера, поэтому необходимо обернуть проведение экспериментов в Docker образ. При при создании контейнера для экспериментов передаются следующие параметры: 
    директория с размеченным набором данных (разбиение на тренировочную и валидационную части можно произвести заранее), директория с результатами обучения и логированием эксперимента (в неё можно скопировать всё содержимое папки *runs/train/exp*/*) 
    Ознакомиться с созданием Docker образов можно по [следующей](https://dker.ru/docs/docker-engine/learn-by-example/build-your-own-images/) ссылке.

При сильном желании можно перейти от задачи детекции к задаче выделения объектов масками (instance segmentation). Классическим приложением для разметки может выступать инструмент LabelMe, или же полуавтоматизированные инструменты, например как RITM. Также в первой ссылке этого абзаца содержится описание альтернативного инструмента для полуавтоматической разметки, также можно воспользоваться им. Соответственно пример кода приложения на iOS/Android для внедрения также нужно будет выбирать другой, ориентированный на решение instance segmentation.
