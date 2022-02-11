cacls "c:\windows\temp" /e /p todos:f
cacls "c:\windows\prefetch" /e /p todos:f
cacls "c:\windows\ccmcache" /e /p todos:f
cd c:\windows\temp
rmdir c:\windows\temp /s /q
cd c:\windows\prefetch
rmdir c:\windows\prefetch /s /q
cd c:\windows\ccmcache
rmdir c:\windows\ccmcache /s /q
javaws -clearcache