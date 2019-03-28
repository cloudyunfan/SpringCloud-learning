@echo off
REM ����Դ���Ŀ¼���Լ�����ű�����Ŀ¼,��ǰ·��Ϊbuild.bat����Ŀ¼,��java maven���Ϊ����       
set SrcPath="Դ���Ŀ¼�����build.bat�����·��"
REM ���ù�������ԭʼ����·�������SrcPath��·�� 
set TargetPath="��������ԭʼ����·�������SrcPath��·��"
REM ����BuildScript\<�滻ΪgroupId>_<�滻ΪartifactId>�����SrcPath��·��
set BuildScriptPath="BuildScript\<�滻ΪgroupId>_<�滻ΪartifactId>�����SrcPath��·��"
REM ����BuildRelease\<�滻ΪgroupId>_<�滻ΪartifactId>�����SrcPath��·��
set BuildReleasePath="BuildRelease\<�滻ΪgroupId>_<�滻ΪartifactId>�����SrcPath��·��"

REM �л���Դ���Ŀ¼��
if exist %SrcPath%  (cd %SrcPath%) else (echo ������Ŀ¼�Ƿ���ڡ� && goto error)

REM  ��ձ���ɹ���Ŀ¼������ʡ�ԣ���ֹ��һ�α��빹������ͬ���ι����������д�һ������Ʒ�⣩
if exist %BuildReleasePath% (rd /S /Q %BuildReleasePath%)
mkdir %BuildReleasePath%

REM ���б���,��java maven���Ϊ��,Ҳ���滻Ϊ��Ŀ�Լ��ı���ű�,call�ýű�����
call mvn clean package

REM �Ա����������߼��жϣ�����ʡ�ԣ�
if %errorlevel%==0 goto success else goto error

REM ����ʧ����ת��ʧ�ܣ����ط���ֵ������ʡ�ԣ�
:error
echo ����ʧ��
exit 1

REM ����ɹ�����ִ�У�����ʡ�ԣ�
:success
REM ���Ʊ���ɹ��ﵽBuildReleaseĿ¼
if exist %TargetPath%\<�滻Ϊ����ɹ���Ŀ¼���ļ���> (xcopy /Q /S %TargetPath%\<�滻Ϊ����ɹ���Ŀ¼���ļ���>  %BuildReleasePath%)  else (echo ������Ŀ¼���ļ��Ƿ���ڡ� && goto error)

REM ����������Ҫ�湹���ɹ���һ�𷢲����ļ���BuildReleaseĿ¼
if exist <�滻Ϊ��Ҫ�湹���ɹ���һ�𷢲����ļ�·�����ļ���> (xcopy /Q /S <�滻Ϊ��Ҫ�湹���ɹ���һ�𷢲����ļ�·�����ļ���>  %BuildReleasePath%)  else (echo ������Ŀ¼���ļ��Ƿ���ڡ� && goto error)

REM �����ϴ���Ʒ�������XML��BuildReleaseĿ¼
if exist %BuildScriptPath%\pom.xml (copy %BuildScriptPath%\pom.xml %BuildReleasePath%)  else (echo ������pom.xml�Ƿ���ڡ� && goto error)
if exist %BuildScriptPath%\assembly.xml (copy %BuildScriptPath%\assembly.xml %BuildReleasePath%)  else (echo ������assembly.xml�Ƿ���ڡ� && goto error)
echo ����ɹ�


