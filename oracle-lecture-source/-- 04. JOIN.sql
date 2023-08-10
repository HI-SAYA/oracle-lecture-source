-- 04. JOIN

------------------------ INNER JOIN
-- 오라클 전용 구문

-- 연결에 사용할 두 컬럼명이 다른 경우  DEPT_ID / DEPT_CODE
SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , DEPT_TITLE
  FROM EMPLOYEE
     , DEPARTMENT
 WHERE DEPT_CODE = DEPT_ID;  -- DEPT_CODE가 NULL 값인 경우 출력되지 않는다.

-- 연결에 사용할 두 컬럼명이 같은 경우
-- 테이블명을 지정하지 않으면 열의 정의가 애매하다는 오류가 발생한다!
SELECT
      EMPLOYEE.EMP_ID
    , EMPLOYEE.EMP_NAME
    , EMPLOYEE.JOB_CODE    -- EMPLOYEE.JOB_CODE 외에 나머지 3개의 셀렉트구문은 앞에 테이블명을 적지 않아도 되지만 일관성을 위해 작성한다.
    , JOB.JOB_NAME
 FROM EMPLOYEE
    , JOB
WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE;  --애매하다는 오류가 날 경우 앞에 테이블명을 명시해서 혼동되지 않도록 해야한다.

-- 테이블명에 별칭을 사용할 수 있다.
SELECT
      E.EMP_ID
    , E.EMP_NAME
    , E.JOB_CODE   
    , J.JOB_NAME
 FROM EMPLOYEE E        -- 별칭 선언 뒤 SELECT절과 WHERE절도 바꿔줄 수 있다.
    , JOB J
WHERE E.JOB_CODE = J.JOB_CODE;


-- ANSI 표준 구문

-- 연결에 사용할 두 컬럼명이 같은 경우 USING
SELECT
      EMP_ID
    , EMP_NAME
    , JOB_CODE
    , JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE); -- USING

-- 연결에 사용할 두 컬럼명이 다른 경우 ON
SELECT
      EMP_ID
    , EMP_NAME
    , DEPT_CODE
    , DEPT_TITLE 
 FROM EMPLOYEE
 JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- 컬럼명이 같은 경우에도 ON으로 작성할 수 있다.
SELECT
      E.EMP_ID
    , E.EMP_NAME
    , E.JOB_CODE
    , J.JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE); -- USING 자리에 ON, 모호하다고 오류가 뜰 때 FROM절과 JOIN절에 있는 테이블명에 별칭을 지어주고 사용하면 된다.


-- DEPARTMENT 테이블과 LOCATION 테이블을 조인하여 모든 컬럼 조회
-- ORACLE 전용
SELECT
      *
FROM DEPARTMENT
    , LOCATION
WHERE LOCATION_ID = LOCAL_CODE;

-- ASNI 표준
SELECT
      *
 FROM DEPARTMENT
 JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE);
 
------------------------ OUTER JOIN

-- 조인은 기본적으로 일치하는 행만 결과에 포함하는 INNER JOIN으로 실행된다.
-- 일치하는 값이 없어도 결과에 포함시키고 싶을 경우 OUTER JOIN을 명시적으로 해야 한다.

-- LEFT OUTER JOIN
-- ANSI 표준
SELECT
       EMP_NAME
     , DEPT_TITLE
  FROM EMPLOYEE
  LEFT /*OUTER*/ JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);    -- LEFT 기준 왼쪽으로 EMPLOYEE , 행 기준이 EMPLOYEE

-- ORACLE 전용
SELECT
       EMP_NAME
     , DEPT_TITLE
  FROM EMPLOYEE
     , DEPARTMENT
 WHERE DEPT_CODE = DEPT_ID(+);   -- DEPARTMENT 쪽에 DEPT_ID에 (+)를 붙여야 한다.
 
 
 
-- RIGHT OUTER JOIN
-- ANSI 표준
SELECT
       EMP_NAME
     , DEPT_TITLE
  FROM EMPLOYEE
  RIGHT /*OUTER*/ JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);    -- RIGHT 기준 오른쪽으로 DEPARTMENT , 행 기준이 DEPARTMENT

-- ORACLE 전용
SELECT
       EMP_NAME
     , DEPT_TITLE
  FROM EMPLOYEE
     , DEPARTMENT
 WHERE DEPT_CODE(+) = DEPT_ID;   -- EMPLOYEE 쪽에 DEPT_CODE에 (+)를 붙여야 한다.
 
 
 
-- FULL OUTER JOIN
-- ANSI 표준
SELECT
       EMP_NAME
     , DEPT_TITLE
  FROM EMPLOYEE
  FULL /*OUTER*/ JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);    -- FULL로 하면 LEFT, RIGHT 둘 다, 모든 행

-- ORACLE 전용
-- FULL OUTER JOIN을 하지 못한다.
SELECT
       EMP_NAME
     , DEPT_TITLE
  FROM EMPLOYEE
     , DEPARTMENT
 WHERE DEPT_CODE = DEPT_ID; 
 
 
-- INNER JOIN을 가장 많이 사용함


-- CROSS JOIN
SELECT
       EMP_NAME
     , DEPT_TITLE
  FROM EMPLOYEE                      -- FROM A CROSS JOIN B
 CROSS JOIN DEPARTMENT;
 
SELECT
       EMP_NAME
     , DEPT_TITLE
  FROM EMPLOYEE
     , DEPARTMENT;                  -- WHERE절을 쓰지 않으면 CROSS JOIN과 같아진다. 실수 예시
 
 
-- NON EQUAL JOIN
-- 등호 이외의 비교연산자를 사용하여 조인하는 것

-- ANSI 표준
SELECT
      EMP_NAME
    , SALARY
    , E.SAL_LEVEL "EMPLOYEE의 SAL_LEVEL"
    , S.SAL_LEVEL "SAL_GRADE의 SAL_LEVEL"
FROM EMPLOYEE E
JOIN SAL_GRADE S ON(SALARY BETWEEN MIN_SAL AND MAX_SAL);
       
-- ORACLE 전용
SELECT
      EMP_NAME
    , SALARY
    , E.SAL_LEVEL "EMPLOYEE의 SAL_LEVEL"
    , S.SAL_LEVEL "SAL_GRADE의 SAL_LEVEL"
FROM EMPLOYEE E
   , SAL_GRADE S
WHERE SALARY BETWEEN MIN_SAL AND MAX_SAL;       -- 이 조건이 TRUE가 되는 행과 연결을 하겠다. 라는 의미


--SELF JOIN
-- ANSI 표준
SELECT
       E1.EMP_ID 사번
     , E1.EMP_NAME 직원명
     , E1.MANAGER_ID 관리자사번
     , E2.EMP_NAME 관리자명
  FROM EMPLOYEE E1
  JOIN EMPLOYEE E2 ON(E1.MANAGER_ID = E2.EMP_ID);
  
-- ORACLE 표준
SELECT
       E1.EMP_ID 사번
     , E1.EMP_NAME 직원명
     , E1.MANAGER_ID 관리자사번
     , E2.EMP_NAME 관리자명
  FROM EMPLOYEE E1
     , EMPLOYEE E2
 WHERE E1.MANAGER_ID = E2.EMP_ID;
 

-- 다중 JOIN : 두 개 이상의 테이블 JOIN
-- ANSI 표준
-- 조인 구문 나열 순서에 유의해야 한다!
SELECT
       EMP_NAME
     , DEPT_TITLE
     , LOCAL_NAME
  FROM EMPLOYEE
  JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
  JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE);      -- 두서없이 나열하면 안된다. (부적합한 식별자)
  
-- ORACLE 전용
-- 테이블명의 서술 순서는 관계 없음!
SELECT
       EMP_NAME
     , DEPT_TITLE
     , LOCAL_NAME
  FROM EMPLOYEE
     , DEPARTMENT           -- 순서 상관 없음
     , LOCATION
 WHERE DEPT_CODE = DEPT_ID
   AND LOCATION_ID = LOCAL_CODE;
   
-- 직급이 대리이면서 아시아 지역에 근무하는 직원의
-- 이름, 직급명, 부서명, 근무지역명 조회

-- ANSI 표준
SELECT
       EMP_NAME
     , JOB_NAME
     , DEPT_TITLE
     , LOCAL_NAME
  FROM EMPLOYEE
  JOIN JOB USING(JOB_CODE)
  JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
  JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE)
 WHERE JOB_NAME = '대리'
   AND LOCAL_NAME LIKE 'ASIA%';

-- ORACLE 전용
SELECT
       EMP_NAME
     , JOB_NAME
     , DEPT_TITLE
     , LOCAL_NAME
  FROM EMPLOYEE E
     , JOB J
     , DEPARTMENT D
     , LOCATION L
 WHERE E.JOB_CODE = J.JOB_CODE
   AND E.DEPT_CODE = D.DEPT_ID
   AND D.LOCATION_ID = L.LOCAL_CODE
   AND JOB_NAME = '대리'
   AND LOCAL_NAME LIKE 'ASIA%';
   
   