package ${controllerPackage};

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import ${modelPackage}.${modelName};
import ${servicePackage}.${modelName}Service;
import ${basePackage}.web.BaseController;
import com.ex.framework.data.IDUtils;
import com.ex.framework.data.Record;
import com.ex.framework.data.RecordBody;
import com.ex.framework.web.ApiResult;
import com.ex.framework.web.ExPage;
import com.ex.framework.web.ExPageResult;
import com.ex.framework.web.TableResult;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/${modelName2}")
public class ${modelName}Controller extends BaseController {

    protected static Logger logger = LoggerFactory.getLogger(${modelName}Controller.class);

    private static final String PAGE_ROOT_PATH = "${modelName2}";

    @Autowired
    ${modelName}Service ${modelName2}Service;

    @GetMapping
    public String index(ModelMap map) {
        return PAGE_ROOT_PATH + "/index";
    }

    @PostMapping("list")
    @ResponseBody
    public Object list(@RecordBody Record record) {
        try {
            <#list searchFields as f>
            String ${f.name} = record.getString("${f.name}");
            </#list>

            QueryWrapper<${modelName}> wrapper = new QueryWrapper<>();
            <#list searchFields as f>
            wrapper.likeRight(StringUtils.isNotEmpty(${f.name}), "${f.name}", ${f.name});
            </#list>

            ExPage page = parseExPage(record);
            ExPageResult<${modelName}> pageResult = ${modelName2}Service.list(page, wrapper);
            return TableResult.success(pageResult);
        } catch (Exception ex) {
            logger.error(ex.getLocalizedMessage(), ex);
            return TableResult.error(ex.getLocalizedMessage());
        }
    }

    @GetMapping("add")
    public String createForm(ModelMap map) {
        return PAGE_ROOT_PATH +"/add";
    }

    @PostMapping("create")
    @ResponseBody
    public Object create(@RequestBody ${modelName} model) {
        try {
            if (model == null) {
                return ApiResult.error("????????????");
            }
            model.setId(IDUtils.getSequenceStr());
            boolean isSuccess = ${modelName2}Service.add(model);
            if (!isSuccess) {
                return ApiResult.error("????????????");
            }
            return ApiResult.success();
        } catch (Exception ex) {
            logger.error(ex.getLocalizedMessage(), ex);
            return ApiResult.error("????????????");
        }
    }

    @GetMapping("edit")
    public String updateForm(@RequestParam("id") String id, ModelMap map) {
        try {
            if (StringUtils.isEmpty(id)) {
                return DEFAULT_ERROR_FORM;
            }
            ${modelName} model = ${modelName2}Service.get(id);
            if (model == null) {
                return DEFAULT_ERROR_FORM;
            }
            map.put("model", toJson(model));
        } catch (Exception ex) {
            logger.error(ex.getLocalizedMessage(), ex);
            return DEFAULT_ERROR_FORM;
        }
        return PAGE_ROOT_PATH +"/edit";
    }

    @PostMapping("update")
    @ResponseBody
    public Object update(@RequestBody ${modelName} model) {
        try {
            if (model == null) {
                return ApiResult.error("????????????");
            }
            if (StringUtils.isEmpty(model.getId())) {
                return ApiResult.error("????????????");
            }
            boolean isSuccess = ${modelName2}Service.updateById(model);
            if (!isSuccess) {
                return ApiResult.error("????????????");
            }
            return ApiResult.success();
        } catch (Exception ex) {
            logger.error(ex.getLocalizedMessage(), ex);
            return ApiResult.error("????????????");
        }
    }

    @PostMapping("delete")
    @ResponseBody
    public Object delete(@RequestParam("id") String id) {
        try {
            if (StringUtils.isEmpty(id)) {
                return ApiResult.error("????????????");
            }
${modelName2}Service.deleteById(id);
            return ApiResult.success();
        } catch (Exception ex) {
            logger.error(ex.getLocalizedMessage(), ex);
            return ApiResult.error("????????????");
        }
    }
}
