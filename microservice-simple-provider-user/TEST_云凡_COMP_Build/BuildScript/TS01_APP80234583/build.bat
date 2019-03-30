@echo off
REM ÉèÖĂÔ´Âë¸ùÄ¿Â¼»̣×Ô¼º±à̉ë½Å±¾ËùÔÚÄ¿Â¼,µ±Ç°Â·¾¶Îªbuild.batËùÔÚÄ¿Â¼,̉Ôjava maven¿̣¼ÜÎªÀư¡£       
set SrcPath="Ô´Âë¸ùÄ¿Â¼Ïà¶ÔÓÚbuild.batµÄÏà¶ÔÂ·¾¶"
REM ÉèÖĂ¹¹½¨°üµÄÔ­Ê¼Éú³ÉÂ·¾¶Ïà¶ÔÓÚSrcPathµÄÂ·¾¶ 
set TargetPath="¹¹½¨°üµÄÔ­Ê¼Éú³ÉÂ·¾¶Ïà¶ÔÓÚSrcPathµÄÂ·¾¶"
REM ÉèÖĂBuildScript\<̀æ»»ÎªgroupId>_<̀æ»»ÎªartifactId>Ïà¶ÔÓÚSrcPathµÄÂ·¾¶
set BuildScriptPath="BuildScript\<̀æ»»ÎªgroupId>_<̀æ»»ÎªartifactId>Ïà¶ÔÓÚSrcPathµÄÂ·¾¶"
REM ÉèÖĂBuildRelease\<̀æ»»ÎªgroupId>_<̀æ»»ÎªartifactId>Ïà¶ÔÓÚSrcPathµÄÂ·¾¶
set BuildReleasePath="BuildRelease\<̀æ»»ÎªgroupId>_<̀æ»»ÎªartifactId>Ïà¶ÔÓÚSrcPathµÄÂ·¾¶"

REM ÇĐ»»µ½Ô´Âë¸ùÄ¿Â¼ÏÂ
if exist %SrcPath%  (cd %SrcPath%) else (echo ¡°Çë¼́²éÄ¿Â¼ÊÇ·ñ´æÔÚ¡± && goto error)

REM  Çå¿Ơ±à̉ë³É¹ûÎïÄ¿Â¼£¨²»¿ÉÊ¡ÂÔ£¬·ÀÖ¹ÉÏ̉»´Î±à̉ë¹¹½¨°üÁªÍ¬±¾´Î¹¹½¨¹¹½¨°ü¼Đ´ø̉»²¢ÉÏÖÆÆ·¿â£©
if exist %BuildReleasePath% (rd /S /Q %BuildReleasePath%)
mkdir %BuildReleasePath%

REM ½øĐĐ±à̉ë,̉Ôjava maven¿̣¼ÜÎªÀư,̉²¿É̀æ»»ÎªÏîÄ¿×Ô¼ºµÄ±à̉ë½Å±¾,call¸Ă½Å±¾¼´¿É
call mvn clean package

REM ¶Ô±à̉ë½á¹û½øĐĐÂß¼­ÅĐ¶Ï£¨²»¿ÉÊ¡ÂÔ£©
if %errorlevel%==0 goto success else goto error

REM ±à̉ëÊ§°Ǜø×ªµ½Ê§°Ü£¬·µ»Ø·ÇÁăÖµ£¨²»¿ÉÊ¡ÂÔ£©
:error
echo ±à̉ëÊ§°Ü
exit 1

REM ±à̉ë³É¹¦¼̀ĐøÖ´ĐĐ£¨²»¿ÉÊ¡ÂÔ£©
:success
REM ¸´ÖÆ±à̉ë³É¹ûÎïµ½BuildReleaseÄ¿Â¼
if exist %TargetPath%\<̀æ»»Îª±à̉ë³É¹ûÎïÄ¿Â¼»̣ÎÄ¼₫Ăû> (xcopy /Q /S %TargetPath%\<̀æ»»Îª±à̉ë³É¹ûÎïÄ¿Â¼»̣ÎÄ¼₫Ăû>  %BuildReleasePath%)  else (echo ¡°Çë¼́²éÄ¿Â¼»̣ÎÄ¼₫ÊÇ·ñ´æÔÚ¡± && goto error)

REM ¸´ÖÆÆäËûĐè̉ªËæ¹¹½¨³É¹ûÎï̉»Æđ·¢²¼µÄÎÄ¼₫µ½BuildReleaseÄ¿Â¼
if exist <̀æ»»ÎªĐè̉ªËæ¹¹½¨³É¹ûÎï̉»Æđ·¢²¼µÄÎÄ¼₫Â·¾¶»̣ÎÄ¼₫Ăû> (xcopy /Q /S <̀æ»»ÎªĐè̉ªËæ¹¹½¨³É¹ûÎï̉»Æđ·¢²¼µÄÎÄ¼₫Â·¾¶»̣ÎÄ¼₫Ăû>  %BuildReleasePath%)  else (echo ¡°Çë¼́²éÄ¿Â¼»̣ÎÄ¼₫ÊÇ·ñ´æÔÚ¡± && goto error)

REM ¸´ÖÆÉÏ´«ÖÆÆ·¿âËùĐèµÄXMLµ½BuildReleaseÄ¿Â¼
if exist %BuildScriptPath%\pom.xml (copy %BuildScriptPath%\pom.xml %BuildReleasePath%)  else (echo ¡°Çë¼́²épom.xmlÊÇ·ñ´æÔÚ¡± && goto error)
if exist %BuildScriptPath%\assembly.xml (copy %BuildScriptPath%\assembly.xml %BuildReleasePath%)  else (echo ¡°Çë¼́²éassembly.xmlÊÇ·ñ´æÔÚ¡± && goto error)
echo ±à̉ë³É¹¦


