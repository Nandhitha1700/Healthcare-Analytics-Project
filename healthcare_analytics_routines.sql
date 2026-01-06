-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: healthcare_analytics
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `vw_high_risk_patients`
--

DROP TABLE IF EXISTS `vw_high_risk_patients`;
/*!50001 DROP VIEW IF EXISTS `vw_high_risk_patients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_high_risk_patients` AS SELECT 
 1 AS `patient_id`,
 1 AS `age`,
 1 AS `age_group`,
 1 AS `gender`,
 1 AS `insurance_type`,
 1 AS `chronic_conditions`,
 1 AS `total_admissions`,
 1 AS `total_readmissions`,
 1 AS `last_discharge_date`,
 1 AS `days_since_last_discharge`,
 1 AS `avg_medication_adherence`,
 1 AS `risk_level`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_performance_kpis`
--

DROP TABLE IF EXISTS `vw_performance_kpis`;
/*!50001 DROP VIEW IF EXISTS `vw_performance_kpis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_performance_kpis` AS SELECT 
 1 AS `total_patients`,
 1 AS `total_admissions`,
 1 AS `total_readmissions`,
 1 AS `overall_readmission_rate`,
 1 AS `avg_length_of_stay`,
 1 AS `avg_charges_per_admission`,
 1 AS `total_charges`,
 1 AS `avg_medication_adherence`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_readmission_summary`
--

DROP TABLE IF EXISTS `vw_readmission_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_readmission_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_readmission_summary` AS SELECT 
 1 AS `discharge_month`,
 1 AS `age_group`,
 1 AS `insurance_type`,
 1 AS `primary_diagnosis`,
 1 AS `total_admissions`,
 1 AS `readmissions_30day`,
 1 AS `readmission_rate`,
 1 AS `avg_los`,
 1 AS `avg_charges`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_high_risk_patients`
--

/*!50001 DROP VIEW IF EXISTS `vw_high_risk_patients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_high_risk_patients` AS select `p`.`patient_id` AS `patient_id`,`p`.`age` AS `age`,`p`.`age_group` AS `age_group`,`p`.`gender` AS `gender`,`p`.`insurance_type` AS `insurance_type`,`p`.`chronic_conditions` AS `chronic_conditions`,count(distinct `a`.`admission_id`) AS `total_admissions`,count(distinct `r`.`readmission_id`) AS `total_readmissions`,max(`a`.`discharge_date`) AS `last_discharge_date`,(to_days(curdate()) - to_days(max(`a`.`discharge_date`))) AS `days_since_last_discharge`,avg(`m`.`adherence_rate`) AS `avg_medication_adherence`,(case when (count(distinct `r`.`readmission_id`) >= 2) then 'Very High' when (count(distinct `r`.`readmission_id`) = 1) then 'High' when (`p`.`chronic_conditions` >= 3) then 'Medium' else 'Low' end) AS `risk_level` from (((`patients` `p` left join `admissions` `a` on((`p`.`patient_id` = `a`.`patient_id`))) left join `readmissions` `r` on((`a`.`admission_id` = `r`.`original_admission_id`))) left join `medications` `m` on((`p`.`patient_id` = `m`.`patient_id`))) group by `p`.`patient_id`,`p`.`age`,`p`.`age_group`,`p`.`gender`,`p`.`insurance_type`,`p`.`chronic_conditions` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_performance_kpis`
--

/*!50001 DROP VIEW IF EXISTS `vw_performance_kpis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_performance_kpis` AS select count(distinct `p`.`patient_id`) AS `total_patients`,count(distinct `a`.`admission_id`) AS `total_admissions`,count(distinct `r`.`readmission_id`) AS `total_readmissions`,round(((count(distinct `r`.`readmission_id`) * 100.0) / count(distinct `a`.`admission_id`)),2) AS `overall_readmission_rate`,round(avg(`a`.`length_of_stay`),2) AS `avg_length_of_stay`,round(avg(`a`.`total_charges`),2) AS `avg_charges_per_admission`,round(sum(`a`.`total_charges`),2) AS `total_charges`,round(avg(`m`.`adherence_rate`),2) AS `avg_medication_adherence` from (((`patients` `p` left join `admissions` `a` on((`p`.`patient_id` = `a`.`patient_id`))) left join `readmissions` `r` on((`a`.`admission_id` = `r`.`original_admission_id`))) left join `medications` `m` on((`p`.`patient_id` = `m`.`patient_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_readmission_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_readmission_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_readmission_summary` AS select date_format(`a`.`discharge_date`,'%Y-%m') AS `discharge_month`,`p`.`age_group` AS `age_group`,`p`.`insurance_type` AS `insurance_type`,`a`.`primary_diagnosis` AS `primary_diagnosis`,count(distinct `a`.`admission_id`) AS `total_admissions`,sum((case when (`r`.`is_30day_readmit` = 'Yes') then 1 else 0 end)) AS `readmissions_30day`,round(((sum((case when (`r`.`is_30day_readmit` = 'Yes') then 1 else 0 end)) * 100.0) / count(distinct `a`.`admission_id`)),2) AS `readmission_rate`,round(avg(`a`.`length_of_stay`),1) AS `avg_los`,round(avg(`a`.`total_charges`),2) AS `avg_charges` from ((`admissions` `a` join `patients` `p` on((`a`.`patient_id` = `p`.`patient_id`))) left join `readmissions` `r` on((`a`.`admission_id` = `r`.`original_admission_id`))) group by `discharge_month`,`p`.`age_group`,`p`.`insurance_type`,`a`.`primary_diagnosis` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-06 20:00:22
