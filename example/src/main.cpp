#include <QApplication>
#include <QMessageBox>
#include <QObject>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQuickWindow>
#include <qlogging.h>
#include <qqmlcontext.h>
#include <qtenvironmentvariables.h>

class AboutQtController : public QObject {
    Q_OBJECT
public:
    AboutQtController(QObject* parent = nullptr)
        : QObject { parent }
    {
    }
signals:
    void showAboutQt();
public slots:
    void showAboutQtDialog() { QMessageBox::aboutQt(nullptr, "About Qt"); }
};

int main(int argc, char* argv[])
{
    qDebug() << "LINGMOUI_TEMP_IMPORT_PATH: " << LINGMOUI_TEMP_IMPORT_PATH;

    // QQuickWindow::setGraphicsApi(QSGRendererInterface::Vulkan);

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.addImportPath(LINGMOUI_TEMP_IMPORT_PATH);

    // 创建 AboutQtController 对象
    AboutQtController aboutQtController(&app);

    // 将 aboutQtController 注册到 QML 上下文中
    engine.rootContext()->setContextProperty("aboutQtController",
        &aboutQtController);

    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    QString graphicsApiUsed = "";
    switch (QQuickWindow::graphicsApi()) {
    case QSGRendererInterface::Unknown:
        graphicsApiUsed = "Unknown";
        break;
    case QSGRendererInterface::Software:
        graphicsApiUsed = "Software Rendering";
        break;
    case QSGRendererInterface::OpenGL:
        graphicsApiUsed = "OpenGL Rendering";
        break;
    case QSGRendererInterface::Vulkan:
        graphicsApiUsed = "Vulkan Rendering";
        break;
    case QSGRendererInterface::Direct3D11:
        graphicsApiUsed = "Direct3D11 Rendering";
        break;
    case QSGRendererInterface::Direct3D12:
        graphicsApiUsed = "Direct3D11 Rendering";
        break;
    default:
        graphicsApiUsed = "Unknown";
    }

    qDebug() << "Using graphical API: " << graphicsApiUsed;

    return app.exec();
}

#include "main.moc"
