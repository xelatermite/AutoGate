include version.mak

PLUGIN=$(PROJECT)_$(VER).zip
PLUGIN_FILES=ReadMe.txt Pilot\ Instructions,\ Type\ 2S\ display.pdf $(PROJECT)/alert.wav $(PROJECT)/lin.xpl $(PROJECT)/mac.xpl $(PROJECT)/win.xpl $(PROJECT)/OpenAL32.dll $(PROJECT)/32/win.xpl $(PROJECT)/64/lin.xpl $(PROJECT)/64/win.xpl

PACKAGE=$(PROJECT)_kit_$(VER).zip
PACKAGE_FILES=AutoGate.html imgs/*.jpeg Helpers/*.dds Helpers/*.png Helpers/*.obj Jetways-Glass/*.dds Jetways-Glass/*.obj Jetways-Steel/*.dds Jetways-Steel/*.obj DGSs-Safedock2S/*.dds DGSs-Safedock2S/*.obj DGSs-Safegate/*.dds DGSs-Safegate/*.obj Standalone-Safedock2S/*.dds Standalone-Safedock2S/*.obj Standalone-Safegate/*.dds Standalone-Safegate/*.obj

INSTALLDIR=~/Desktop/X-Plane\ 10/Resources/plugins

all:	$(PLUGIN) $(PACKAGE)

clean:
	rm $(PLUGIN) $(PACKAGE)

install:	$(PLUGIN)
	rm -rf $(INSTALLDIR)/$(PROJECT)
	unzip -o -d $(INSTALLDIR) $(PLUGIN)

$(PLUGIN):	$(PLUGIN_FILES)
	touch $(PLUGIN_FILES)
	chmod +x $(PROJECT)/*.xpl $(PROJECT)/32/*.xpl $(PROJECT)/64/*.xpl
	rm -f $(PLUGIN)
	zip -MM -o $(PLUGIN) $(PLUGIN_FILES)

$(PACKAGE):	$(PACKAGE_FILES)
	./clone.py
	touch $(PACKAGE_FILES)
	rm -f $(PACKAGE)
	zip -MM $(PACKAGE) $(PACKAGE_FILES)
