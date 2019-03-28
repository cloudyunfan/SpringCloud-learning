@echo off
REM 设置源码根目录或自己编译脚本所在目录,当前路径为build.bat所在目录,以java maven框架为例。       
set SrcPath="源码根目录相对于build.bat的相对路径"
REM 设置构建包的原始生成路径相对于SrcPath的路径 
set TargetPath="构建包的原始生成路径相对于SrcPath的路径"
REM 设置BuildScript\<替换为groupId>_<替换为artifactId>相对于SrcPath的路径
set BuildScriptPath="BuildScript\<替换为groupId>_<替换为artifactId>相对于SrcPath的路径"
REM 设置BuildRelease\<替换为groupId>_<替换为artifactId>相对于SrcPath的路径
set BuildReleasePath="BuildRelease\<替换为groupId>_<替换为artifactId>相对于SrcPath的路径"

REM 切换到源码根目录下
if exist %SrcPath%  (cd %SrcPath%) else (echo “请检查目录是否存在” && goto error)

REM  清空编译成果物目录（不可省略，防止上一次编译构建包联同本次构建构建包夹带一并上制品库）
if exist %BuildReleasePath% (rd /S /Q %BuildReleasePath%)
mkdir %BuildReleasePath%

REM 进行编译,以java maven框架为例,也可替换为项目自己的编译脚本,call该脚本即可
call mvn clean package

REM 对编译结果进行逻辑判断（不可省略）
if %errorlevel%==0 goto success else goto error

REM 编译失败跳转到失败，返回非零值（不可省略）
:error
echo 编译失败
exit 1

REM 编译成功继续执行（不可省略）
:success
REM 复制编译成果物到BuildRelease目录
if exist %TargetPath%\<替换为编译成果物目录或文件名> (xcopy /Q /S %TargetPath%\<替换为编译成果物目录或文件名>  %BuildReleasePath%)  else (echo “请检查目录或文件是否存在” && goto error)

REM 复制其他需要随构建成果物一起发布的文件到BuildRelease目录
if exist <替换为需要随构建成果物一起发布的文件路径或文件名> (xcopy /Q /S <替换为需要随构建成果物一起发布的文件路径或文件名>  %BuildReleasePath%)  else (echo “请检查目录或文件是否存在” && goto error)

REM 复制上传制品库所需的XML到BuildRelease目录
if exist %BuildScriptPath%\pom.xml (copy %BuildScriptPath%\pom.xml %BuildReleasePath%)  else (echo “请检查pom.xml是否存在” && goto error)
if exist %BuildScriptPath%\assembly.xml (copy %BuildScriptPath%\assembly.xml %BuildReleasePath%)  else (echo “请检查assembly.xml是否存在” && goto error)
echo 编译成功


