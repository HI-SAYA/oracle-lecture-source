-- 2. �Լ�(Function)

-- �׷� �Լ�
--  SUM : �հ踦 ���Ͽ� ����
SELECT
   SUM (SALARY)
  FROM EMPLOYEE;
  
-- AVG : ����� ���Ͽ� ����
SELECT
   AVG (SALARY)         -- SUM�̳� AVG ���ڸ� �ش��Ѵ�.
  FROM EMPLOYEE;
  
-- MAX : �÷����� ���� ū �� ����. ��� �ϴ� �ڷ����� ANY TYPE.
SELECT
     MAX (EMAIL)        -- VARCHAR2
   , MAX (HIRE_DATE)    -- ���� �ֱ��� ��¥
   , MAX (SALARY)       -- ���� ū ����
  FROM EMPLOYEE;
  
-- MIN : �÷����� ���� ���� �� ����. ��� �ϴ� �ڷ����� ANY TYPE.
SELECT
     MIN (EMAIL)        -- VARCHAR2
   , MIN (HIRE_DATE)    -- ���� ���� ��¥
   , MIN (SALARY)       -- ���� ���� ����
  FROM EMPLOYEE;
  
-- COUNT : ���� ������ ��Ʒ��� ����
SELECT
      COUNT(*)                  -- * : ��� / EMPLOYEE�� �ִ� ��� ���� �����ͼ� COUNT / NULL �� ����
    , COUNT(DEPT_CODE)          -- NULL ���� ���Ե��� �ʴ´�.
    , COUNT(DISTINCT DEPT_CODE) -- DISTINCT �ߺ� ����
 FROM EMPLOYEE;
 
-- ������ �Լ�
 
-- ���� ó�� �Լ�

-- LENGTH, LENGTHB
SELECT
       LENGTH('����Ŭ')
     , LENGTHB('����Ŭ') -- ����Ʈ ������ �˾ƾ� �� �� ���
  FROM DUAL;            -- ���� �� ��ȯ�ϴ� �� ���

SELECT
       LENGTH(EMAIL)    -- ����� ����Ʈ ���� ���ͷ� ���� ���̰� ����.
     , LENGTHB(EMAIL)
  FROM EMPLOYEE;
  
-- INSTR
SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', 1) FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL;        -- ���� �Է� �� �Ųٷ� ã�ư���. / �ε��� ����
SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL;      -- �ι�° B�� ã�ƶ�.
SELECT INSTR('AABAACAABBAA', 'B', -1, 2) FROM DUAL;     -- �Ųٷ� �ι�° B�� ã�ƶ�.

SELECT
       EMAIL
     , INSTR(EMAIL, '@', -1) ��ġ
  FROM EMPLOYEE;
  
-- LPAD / RPAD
SELECT LPAD(EMAIL, 20, '#') FROM EMPLOYEE;      -- 20�� ����, ������ �κ��� #���� ä���. L ���� / R ������
SELECT RPAD(EMAIL, 20, '#') FROM EMPLOYEE;      -- 20�� ���ڸ� ���� �ް� ������ #�� ���� ��� �������� ��Ÿ ����.
SELECT RPAD(EMAIL, 10) FROM EMPLOYEE;
SELECT RPAD(EMAIL, 10) FROM EMPLOYEE;

-- LTRIM / RTRIM / TRIM     ���� ���� ����
SELECT LTRIM(' OHGIRAFFERS') FROM DUAL;                 
SELECT LTRIM(' OHGIRAFFERS', ' ') FROM DUAL;                -- ������ �����ϰڽ��ϴ�. ��� �ǹ�
SELECT LTRIM('000123456', '0') FROM DUAL;                   -- 0�̶�� ���ڸ� �����ϰڽ��ϴ�.
SELECT LTRIM('123123OHGIRAFFERS', '123') FROM DUAL;         -- 123�� �����ϰڽ��ϴ�.
SELECT LTRIM('132123OHGIRAFFERS123', '123') FROM DUAL;      -- ���ʸ� �����ϰ� �������� �������� �ʴ´�. LTRIM / 123�� ���� ���ε��� �����Ѵ�.
SELECT LTRIM('ACABACOHGIRAFFERS', 'ABC') FROM DUAL;         -- ABC ����
SELECT LTRIM('5782OHGIRAFFERS', '0123456789') FROM DUAL;    -- ���ڸ� ��� �����ϰ� ���� �� ���� ���� ������ �ȴ�.

SELECT RTRIM('OHGIRAFFERS ') FROM DUAL;
SELECT RTRIM('OHGIRAFFERS ', ' ') FROM DUAL;
SELECT RTRIM('123456000', '0') FROM DUAL;
SELECT RTRIM('OHGIRAFFERS123123', '123') FROM DUAL;
SELECT RTRIM('123123OHGIRAFFERS123', '123') FROM DUAL;      -- ������ ���� X 
SELECT RTRIM('OHGIRAFFERSACABAC', 'ABC') FROM DUAL;
SELECT RTRIM('OHGIRAFFERS5782', '0123456789') FROM DUAL;

SELECT TRIM(' OHGIRAFFERS ') FROM DUAL;                         -- �� ���� ���� ����
SELECT TRIM('Z' FROM 'ZZZOHGIRAFFERSZZZ') FROM DUAL;            -- �� �ʿ� �����ϰ� ���� ���ڸ� ������ �� ���� �����ϰ� ���� ���� ����
SELECT TRIM(LEADING 'Z' FROM 'ZZZOHGIRAFFERSZZZ') FROM DUAL;    -- LEADING ���ʿ��� ����
SELECT TRIM(TRAILING 'Z' FROM 'ZZZOHGIRAFFERSZZZ') FROM DUAL;   -- TRAILING �����ʿ��� ����
SELECT TRIM(BOTH 'Z' FROM 'ZZZOHGIRAFFERSZZZ') FROM DUAL;       -- BOTH �� ���������� ���� 86��� ����� �����ϴ�.

-- SUBSTR   /   SUBSTRB (����Ʈ ����)
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;        -- 5��° �ڸ����� 2�� �ڸ��ڴ�.
SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL;           -- 7��° �ڸ��������� ������ �ڸ��ڴ�.
SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL;       -- �ڿ������� 8��° �ڸ����� 3�� ���� �ڸ��ڴ�.
SELECT SUBSTR('��� �� �� �Ӵ�', 2, 5) FROM DUAL;         -- �ι�°���� �ټ���(��������)

SELECT
      SUBSTR('ORACLE', 3, 2)
    , SUBSTRB('ORACLE', 3, 2)
 FROM DUAL;
 
SELECT
      SUBSTR('����Ŭ', 2, 2)
    , SUBSTRB('����Ŭ', 4, 6)
 FROM DUAL;
 
--------------------------------
-- �������� �ֹ� ��ȣ�� ��ȸ�Ͽ� �����, ����, ����, ������ ���� �и��Ͽ� ��ȸ(�÷� ��Ī ���)
SELECT
      EMP_NAME �����
    , SUBSTR (EMP_NO, 1, 2) ����
    , SUBSTR (EMP_NO, 3, 2) ����
    , SUBSTR (EMP_NO, 5, 2) ����
 FROM EMPLOYEE;
 
-- ��¥ �����Ϳ��� SUBSTR ��� ����
-- �Ի��Ͽ��� �Ի�⵵, �Ի��, �Ի� ��¥ ���� �и��Ͽ� ��ȸ
SELECT
      HIRE_DATE
    , SUBSTR(HIRE_DATE, 1, 2) �Ի�⵵
    , SUBSTR(HIRE_DATE, 4, 2) �Ի��
    , SUBSTR(HIRE_DATE, 7, 2) �Ի���
     FROM EMPLOYEE;
     
-- WHERE������ �Լ��� ����� �� �ִ�.
-- EMP_NO�� ���� ������ �Ǵ��Ͽ� ���� ������ ��� �÷� ���� ��ȸ
SELECT
       *
  FROM EMPLOYEE
 WHERE SUBSTR(EMP_NO, 8, 1) = '2';
 
-- WHERE������ ������ �Լ��� ��� ����
SELECT
      *
FROM EMPLOYEE
WHERE AVG(SALARY) > 100;        -- AVG �׷��Լ��� WHERE �Ұ���

-- �Լ� ��ø ��� ����
-- ������ �ֹι�ȣ�� ��ȸ�Ѵ�. �ֹι�ȣ�� ������� ���� '-' ������ ���� '*'�� �ٲ� ����Ѵ�.
SELECT
      EMP_NAME
    , RPAD(SUBSTR(EMP_NO, 1, 7), 14, '*')       -- SUBSTR -> RPAD �������� *�� �ٲٰڴ�.
FROM EMPLOYEE;

-- ������ �̸����� ��ȸ�Ѵ�. �̸����� @ ���ĸ� ������ ���̵� ��ȸ�Ѵ�.
SELECT
      EMP_NAME
    , SUBSTR(EMAIL, 1 , INSTR(EMAIL, '@')-1)     -- ù��° ��ġ���� @ ������
FROM EMPLOYEE;

-- LOWER / UPPER / INITCAP
SELECT LOWER('Welcome To My World') FROM DUAL;      -- �ҹ��ڷ� �����.
SELECT UPPER('Welcome To My World') FROM DUAL;      -- �빮�ڷ� �����.
SELECT INITCAP('welcome To My World') FROM DUAL;    -- ���� �� ���ڸ� �빮�ڷ� ���ش�.

-- CONCAT
SELECT CONCAT ('�����ٶ�', 'ABCD') FROM DUAL;       -- ���ڿ� ��ġ��

-- REPLACE
SELECT REPLACE('����� ������ ���ﵿ', '���ﵿ', '�Ｚ��') FROM DUAL;
-- ù��° ���ڰ� ��� ���ڿ�, �ι�° ���ڿ��� �ٲٰ� ���� Ÿ��, ����° ���ڿ��� ���� �ٲܰ���


-- ���� ó�� �Լ�

-- ABS
SELECT ABS(10), ABS(-10) FROM DUAL;         -- ABS �������� ��ȯ

-- MOD
SELECT MOD(10, 5), MOD(10, 30) FROM DUAL;       -- 10 % 5 / 10 % 3

-- ROUND : �ݿø�
SELECT ROUND(123.456) FROM DUAL;
SELECT ROUND(123.456, 0) FROM DUAL;             -- �ڸ����� ���ߴ� ��
SELECT ROUND(123.456, 1) FROM DUAL;             -- �Ҽ��� ù°�ڸ� ����(�ݿø� �� ���·�)
SELECT ROUND(123.456, 2) FROM DUAL;             -- �Ҽ��� ��°�ڸ� ����(�ݿø� �� ���·�)
SELECT ROUND(123.456, -2) FROM DUAL;            -- ���� ��°�ڸ� �ݿø� / 100

-- FLOOR : ����
SELECT FLOOR (123.456) FROM DUAL;               -- ������ ���缭 �Ҽ��� �ڸ���
SELECT FLOOR (123.678) FROM DUAL;               -- ����

-- TRUNC : ���� (�ڸ��� ����)
SELECT TRUNC(123.456) FROM DUAL;               -- FLOOR ó�� �߶� ������. 
SELECT TRUNC(123.678) FROM DUAL;               -- �ƹ� ���ڵ� �������� �ʾұ� ������
SELECT TRUNC(123.678, 1) FROM DUAL;            -- ù��° �ڸ����� ������ �ڸ���.
SELECT TRUNC(123.678, 2) FROM DUAL;            -- �ι�° �ڸ����� ����
SELECT TRUNC(123.678, -1) FROM DUAL;           -- ���� ù°�ڸ� ������ ����

-- CEIL : �ø�
SELECT CEIL(123.456) FROM DUAL;                -- ������ �ø�
SELECT CEIL(123.678) FROM DUAL;                -- ������ �ø�


-- ��¥ ó�� �Լ�

-- SYSDATE
SELECT SYSDATE FROM DUAL;

-- MONTH_BETWEEN : �� ��¥�� ���� �� ���� ���ڷ� ����
SELECT
      EMP_NAME
    , HIRE_DATE
    , CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))        -- HIRE_DATE���� ���� ��¥���� ��� �������� ���
 FROM EMPLOYEE;
 
-- ADD_MONTHS : ��¥�� ���ڸ�ŭ ���� ���� ���ؼ� ��¥�� ����
SELECT
       ADD_MONTHS(SYSDATE, 5)       -- ��¥�� ����, ����(�ս�����/5����)
  FROM DUAL;
  
-- �ٹ������ 20�� �̻��� �������� ��� �÷� ��ȸ
SELECT
      *
 FROM EMPLOYEE
-- WHERE MONTHS_BETWEEN(SYSDATE, HIRE_DATE) >= 240;
WHERE ADD_MONTHS(HIRE_DATE, 240) <= SYSDATE;

-- NEXT_DAY : ���� ��¥���� ���Ϸ��� ���Ͽ� ���� ����� ��¥ ����
SELECT SYSDATE, NEXT_DAY(SYSDATE, '�ݿ���') FROM DUAL;     -- (���� �Ǵ� ��¥, ������ �Ǵ� ��¥�κ��� ���� ����� �ݿ���)�� ã�ڴ�.
SELECT SYSDATE, NEXT_DAY(SYSDATE, '��') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 6) FROM DUAL;           -- 1~7 (1- �Ͽ��� 7- ������)

SELECT SYSDATE, NEXT_DAY(SYSDATE, 'FRIDAY') FROM DUAL;
-- �ý��� ȯ�濡 ���� ��� ������ ����
ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
ALTER SESSION SET NLS_LANGUAGE = KOREAN;

-- LAST_DAY : �ش� ���� ������ ��¥�� ����
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;

-- �����, �Ի���, �Ի���� �ٹ��ϼ�(�ָ� ����)
SELECT
       EMP_NAME
     , HIRE_DATE
     , LAST_DAY(HIRE_DATE) - HIRE_DATE + 1 "�Ի�� �ٹ��ϼ�"       -- �Ի��� ���� ������ �� - �Ի��� �� = �ϼ� (�Ϸ� �ٹ�ǥ�� +1)
  FROM EMPLOYEE;
  
-- EXTRACT : ��, ��, �� ������ �����Ͽ� ����
SELECT
      EXTRACT(YEAR FROM SYSDATE) �⵵
    , EXTRACT(MONTH FROM SYSDATE) ��
    , EXTRACT(DAY FROM SYSDATE) ��
 FROM DUAL;
 
 -- ������ �̸�, �Ի���, �ٹ���� ��ȸ
SELECT
      EMP_NAME
    , HIRE_DATE
    , EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)     -- 2023 - 1990
 FROM EMPLOYEE;
 
 -- �ٹ������ ������ ����ϴ� ��쿡�� ���� ���̸� ����ؾ� �Ѵ�.
 SELECT
      EMP_NAME
    , HIRE_DATE
    , FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) "�� �ٹ����"    -- FROOR 22.XXX (�ڿ� ����������) (�ս�_��Ʈ��) �������, �Ի��� ���� = ������ / 12
 FROM EMPLOYEE;


-- // FORMAT // 
-- TO_CHAR(���ڿ��� ������) / TO_DATE(���ڿ��̳� ���ڸ� ��¥���� ������) / TO_NUMBER(���ڸ� �����ؼ� ���ڷ� ������)

-- ����ȯ �Լ�

-- TO_CHAR
SELECT TO_CHAR(1234) FROM DUAL;
SELECT TO_CHAR(1234, '99999') FROM DUAL;    -- '99999' �ڸ��� ����ش�. 5���̱� ������ 5���ڷ� ���缭 �������ִ� ��
SELECT TO_CHAR(1234, '00000') FROM DUAL;    -- '00000' ���ڸ��� 0���� ä���.
SELECT TO_CHAR(1234, 'L99999') FROM DUAL;   -- L�� ���̸� �ý��� �󿡼� ������ �ִ� �ܷ� ���´�. �տ� FM�� ���̸� �տ� ���� ���� 
SELECT TO_CHAR(1234, '$99999') FROM DUAL;   -- $�� ���̸� $1234
SELECT TO_CHAR(1234, '00,000') FROM DUAL;   -- 01,234
SELECT TO_CHAR(1234, '999') FROM DUAL;      -- ������� ǥ���� �� ����.

-- ���� ���̺��� �����, �޿� ��ȸ
-- �޿��� '\9,000,000' �������� ǥ���ϼ���
SELECT
      EMP_NAME
    , TO_CHAR(SALARY, 'L99,999,999')
 FROM EMPLOYEE;

SELECT TO_CHAR(SYSDATE, 'PM HH24:MI:SS') FROM DUAL;     -- HH�ð� MI�� SS�� 24�÷� ��� 
SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS') FROM DUAL;       
SELECT TO_CHAR(SYSDATE, 'MON DY, YYYY') FROM DUAL;      -- ��, ����, ��
SELECT TO_CHAR(SYSDATE, 'YYYY-fmMM-DD DAY') FROM DUAL;  -- ��, (0)��, ��
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YEAR, Q') || '�б�' FROM DUAL;  -- ???????

SELECT
       EMP_NAME
     , TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') �Ի���
  FROM EMPLOYEE;
SELECT
       EMP_NAME
     , TO_CHAR(HIRE_DATE, 'YYYY"��" MM"��" DD"��"') �Ի���  -- "" �ѱ� �� ����� �ν�
  FROM EMPLOYEE;
SELECT
       EMP_NAME
    , TO_CHAR(HIRE_DATE, 'YYYY/MM/DD HH24:MI:SS') ���Ի���
 FROM EMPLOYEE;

-- RR�� YY�� ����
-- RR�� ���ڸ� �⵵�� ���ڸ��� �ٲ� �� �ٲ� �⵵�� 50�� �̸��̸� 2000���� �����ϰ�
-- 50�� �̻��̸� 1900���� �����Ѵ�.
-- YY�� �⵵�� �ٲ� �� ���� ����(2000��)�� �����Ѵ�.
SELECT
       TO_CHAR(TO_DATE('980630', 'YYMMDD'), 'YYYY-MM-DD')       -- ?????????????
  FROM DUAL;
SELECT
       TO_CHAR(TO_DATE('980630', 'RRMMDD'), 'YYYY-MM-DD')
  FROM DUAL;

-- ���� ��¥���� ���� ���
SELECT
      TO_CHAR(SYSDATE, 'MM')
    , TO_CHAR(SYSDATE, 'MONTH')
    , TO_CHAR(SYSDATE, 'MON')
    , TO_CHAR(SYSDATE, 'RM')
 FROM DUAL;

-- ���� ��¥���� �ϸ� ���
SELECT
      TO_CHAR(SYSDATE, '"1�� ���� " DDD"�� °"')
    , TO_CHAR(SYSDATE, '"�� ���� " DD"�� °"')
    , TO_CHAR(SYSDATE, '"�� ���� " D"�� °"')
 FROM DUAL;
 
 -- ���� ��¥���� �б�� ���� ��� ó��
SELECT
      TO_CHAR(SYSDATE, 'Q"�б�"')
    , TO_CHAR(SYSDATE, 'DAY')
    , TO_CHAR(SYSDATE, 'DY')
 FROM DUAL;
 
-- �̸��� �Ի��� ��ȸ
-- �Ի��� ������ '2018�� 6�� 15�� (��)' �������� ���
SELECT
       EMP_NAME
     , TO_CHAR(HIRE_DATE, 'RRRR"��" fmMM"��" DD"��" (DY)')
  FROM EMPLOYEE;
  
-- TO_DATE
SELECT
       TO_DATE('20100101', 'RRRRMMDD') -- 10/01/01
  FROM DUAL;
SELECT
       TO_CHAR(TO_DATE('20100101', 'RRRRMMDD'), 'RRRR, MON, DAY') -- �� �� ��Ȯ�ϰ� �˰� ���� ��
  FROM DUAL;
SELECT
       TO_DATE('041030 143000', 'RRMMDD HH24MISS')
  FROM DUAL;
SELECT
       TO_CHAR(TO_DATE('041030 143000', 'RRMMDD HH24MISS'), 'DD-MON-RRRR HH:MI:SS PM')
  FROM DUAL;
  
-- 2000�� ���� �Ի��� ����� ���, �̸�, �Ի��� ��ȸ
SELECT
       EMP_NO
     , EMP_NAME
     , HIRE_DATE
  FROM EMPLOYEE
-- WHERE HIRE_DATE >= TO_DATE('20000101', 'RRRRMMDD');
-- WHERE HIRE_DATE >= '20000101';
-- WHERE HIRE_DATE >= TO_DATE(20000101, 'RRRRMMDD');
 WHERE HIRE_DATE >= 20000101;     -- �ڵ�����ȯ �Ұ� / �ϰ��� ���� ������ ����

-- TO_NUMBER
SELECT '123' + '456' FROM DUAL;     -- ���ڷ� �� ���ͷ����� ���ϱ� �������� ����ϸ� ���ڷ� ����ȯ
SELECT '123' + '456A' FROM DUAL;

-- ����� Ȧ���� �������� ���� ��ȸ
SELECT
       *
  FROM EMPLOYEE
 WHERE MOD(EMP_ID, 2) = 1;

SELECT '1,000,000' + '500,000' FROM DUAL;

SELECT 
       TO_NUMBER('1,000,000', '99,999,999') + TO_NUMBER('500,000', '999,999')
  FROM DUAL;
  

-- NULL ó�� �Լ�

-- NVL(�÷���, NULL�� �� �ٲ� ��)
SELECT
      EMP_NAME
    , BONUS
    , NVL(BONUS, 0)
 FROM EMPLOYEE;
 
-- NVL2(�÷���, ���� ���� ����� ��ü��, NULL�� ����� ��ü��)
-- ���ʽ��� NULL�� ������ 0.5�� NULL�� �ƴ� ������ 0.7�� �����Ͽ� ��ȸ
SELECT
      EMP_NAME
    , BONUS
    , NVL2(BONUS, 0.7, 0.5)
 FROM EMPLOYEE;
 
-- ���� �Լ�

-- DECODE(�÷���, ���ǰ�1, ���ð�1, ���ǰ�2, ���ð�2, ...)

-- ������ �����Ͽ� '��' �Ǵ� '��'�� ��ȸ
SELECT
       EMP_NAME
     , EMP_NO
     , DECODE(SUBSTR(EMP_NO, 8, 1), '1', '��', '2', '��')
  FROM EMPLOYEE;
 
-- ������ ���ڷ� ���� �� ���� ���� ���� �ۼ��ϸ� �ƹ��� ���ǿ� �ش����� ���� ��
-- ������ ���� ���� ������ ������
SELECT
       EMP_NAME
     , EMP_NO
     , DECODE(SUBSTR(EMP_NO, 8, 1), '1', '��', '��')
  FROM EMPLOYEE;
  
-- ���� �޿� �λ�
-- ���� �ڵ� J7 => 10%, J6 >= 15%, J5 >= 20% �׿� => 5%
SELECT
      EMP_NAME
    , JOB_CODE
    , SALARY
    , DECODE(JOB_CODE, 'J7', SALARY * 1.1,     -- DECODE�� ���ǰ��� ����� �� �ִ�.
            'J6', SALARY * 1.15,
            'J5', SALARY * 1.2,
            SALARY * 1.05) �λ�޿�
 FROM EMPLOYEE;
 
-- CASE
/*
  CASE
     WHEN ���ǽ� THEN �����              -- ���ǽĿ� ������ ��������� �ٲ۴�. ������ ���ǽ��� ���� ������ �Ʒ��� �Ѿ��.
     WHEN ���ǽ� THEN �����              -- ũ��, �۴�, AND ���� �ĵ��� ����� �� �ִ�.
     ELSE �����
  END
*/
-- �޿��� 500������ �ʰ��ϸ� ���, 300~500 ���̸� �߱�, �� ���ϴ� �ʱ����� ��ȸ
SELECT
      EMP_NAME
    , SALARY
    , CASE
        WHEN SALARY > 5000000 THEN '���'
        WHEN SALARY BETWEEN 3000000 AND 5000000 THEN '�߱�'
        ELSE '�ʱ�'
      END ����
 FROM EMPLOYEE;
 
