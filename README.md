# tcp-ds-osx-patch
TCP DS v2.10.1rc3 patch for OSX 
This patch adds OSX support. Currently tested only on OSX Mojave 10.14.3.

To use get the [latest TCP-DS source](http://www.tpc.org/tpc_documents_current_versions/download_programs/tools-download-request.asp?bm_type=TPC-DS&bm_vers=2.10.1&mode=CURRENT-ONLY)and apply the patch:
```
$ cd v2.10.1rc3
$ patch -p1 < ../tcp-ds-2.0.osx.patch

```
