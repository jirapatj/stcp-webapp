package com.kmutt.stcp.web.report;

import com.kmutt.stcp.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Gift on 23-Feb-16.
 */
@Controller
@RequestMapping("/report")
public class ReportController {
    private final Logger logger = LoggerFactory.getLogger(ReportController.class);

    private User authorizedUser;
    private ReportModule module;
    private String filterText;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Map<String, Object> model) {
        logger.debug("index() is executed!");

        model.put("title", "test");
        model.put("msg", "message test test test");

        Map<String, String> map = new HashMap<>();
        map.put("studentId", "Student ID");
        map.put("staffId", "Staff ID");
        model.put("idOption", map);

        //displayReportList
        List<ReportMaster> records = new ArrayList<>();
        ReportMaster master = new ReportMaster();
        master.setReportName("Courses");
        master.setReportType(ReportType.NORMAL);
        records.add(master);

        master = new ReportMaster();
        master.setReportName("Study Plan");
        master.setReportType(ReportType.NORMAL);
        records.add(master);

        master = new ReportMaster();
        master.setReportName("Summary");
        master.setReportType(ReportType.STAT);
        records.add(master);

        model.put("records", records);

        return "report/report-controller";
//        return new ResponseEntity<ReportMaster>(master, HttpStatus.OK);
    }


    @RequestMapping(value = "/searchReport", method = RequestMethod.GET)
    public String searchReport(Map<String, Object> model) {
//        model.get("studentId")

        //TODO get filter
        //TODO query report "REPORT_MASTER JOIN..."
        return "";
    }

    //onSelectedReport
    @RequestMapping(value = "/reportCenterGenerator", method = RequestMethod.GET)
    public ResponseEntity<byte[]> reportCenterGenerator(/*@RequestBody String json*/) {
        ReportGenerator generator = new ReportGenerator();
//        r.generateReport(0,null);

        // convert JSON to Employee
//        Employee emp = convertSomehow(json);
//
//        // generate the file
//        PdfUtil.showHelp(emp);

        byte[] pdfContents = generator.generateReport(0,null);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType("application/pdf"));
        headers.add("content-disposition", "inline;filename=exported.pdf");

        headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
        return new ResponseEntity<>(pdfContents, headers, HttpStatus.OK);
    }

    //module clicked
    @RequestMapping(value = "/reportModuleGenerator", method = RequestMethod.GET)
    public ResponseEntity<byte[]> reportModuleGenerator(/*@RequestBody String json*/) {
        //TODO pass moduleId

        ReportGenerator generator = new ReportGenerator();
        //FIXME edit arguments
        if(generator.isReportValid(0)){

            byte[] pdfContents = generator.generateReport(0,null);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.parseMediaType("application/pdf"));
            headers.add("content-disposition", "inline;filename=exported.pdf");

            headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
            return new ResponseEntity<>(pdfContents, headers, HttpStatus.OK);
        }

        return null;
    }

}