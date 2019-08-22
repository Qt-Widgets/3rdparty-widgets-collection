include(qtproject.pri)

#version check qt
!minQtVersion(5, 0, 0) {
    message("Cannot build Qt Canpool with Qt version $${QT_VERSION}.")
    error("Can only use Qt 5.")
}

TEMPLATE = subdirs
CONFIG += ordered

SUBDIRS +=  src \

isEqual(QT_MAJOR_VERSION, 5) {
    SUBDIRS += share
}
