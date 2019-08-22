TEMPLATE = app

QTITANDIR = $$quote($$(QTITANDIR))

isEmpty(QTITANDIR):QTITANDIR = $$quote($$PWD/../../..)

include($$QTITANDIR/src/shared/qtitanribbon.pri)

#DESTDIR = $$QTITANDIR/bin
DESTDIR = $$IDE_APP_PATH
DESTDIR = $$member(DESTDIR, 0)$$QTITAN_LIB_PREFIX
DESTDIR = "$$DESTDIR"

# auto copy dll to STATIC_OUTPUT_BASE
STATIC_OUTPUT_BASE = $$DESTDIR
include($$QTITANDIR/../../data.pri)

!debug_and_release|build_pass {
    CONFIG(debug, debug|release) {
        TARGET = $$member(TARGET, 0)d
    }
}

HEADERS        = mainwindow.h \
                 backstagepages.h

SOURCES        = main.cpp \
                 mainwindow.cpp \
                 backstagepages.cpp

FORMS         = infopage.ui \
                savepage.ui \
                helppage.ui \
                saveemailpage.ui \
                savewebpage.ui \

RESOURCES     = ribbonbackstage.qrc

include($$QTITANDIR/demos/shared/aboutdialog.pri)

macx {
    CONFIG-=app_bundle
}

!lessThan(QT_VER_MAJ, 5) {
  QT += printsupport
}
