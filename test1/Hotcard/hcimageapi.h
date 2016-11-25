#ifndef __HC_IMAGE_API_H__
#define __HC_IMAGE_API_H__


#ifdef D_EXPORTS
#define EXPORT __declspec(dllexport)
#else
#define EXPORT
#endif


// format
#define IMG_FMT_UNK			0
#define IMG_FMT_BMP			1
#define IMG_FMT_JPG			2

// component
#define IMG_COMPONENT_GRAY	1
#define IMG_COMPONENT_RGB	3


// error code
#define RET_OK				1
#define RET_ERR_UNK			0  /* unknown error */
#define RET_ERR_PTR			-1 /* invalid pointer */
#define RET_ERR_ARG			-2 /* error parameter */
#define RET_ERR_MEM			-3 /* fail to allocate memory */


typedef struct _IMG_ENGINE 
{
	unsigned char * pImage;
	int width, height, quality,
		format, components;
} IEngine, *PIEngine;





#ifdef __cplusplus
extern "C" {
#endif

EXPORT int HC_IMG_InitImage(PIEngine pIEngine, int components, int quality);
EXPORT int HC_IMG_LoadImage(PIEngine pIEngine, char *filename);
EXPORT int HC_LoadMemJpg(PIEngine pIEngine, char *pImgMem,int imgSize);
EXPORT int HC_IMG_SaveImage(PIEngine pIEngine, char *filename);
EXPORT int HC_IMG_FreeImage(PIEngine pIEngine);
EXPORT int HC_IMG_SetSaveParams(PIEngine pIEngine, 
			unsigned char *pImage, int width, int height, int components);


// easy usage for Java
EXPORT PIEngine HC_IMG_CreateEngine();
EXPORT int HC_IMG_CloseEngine(PIEngine pIEngine);
EXPORT unsigned char * HC_IMG_GetImageData(PIEngine pIEngine);
EXPORT int HC_IMG_GetImageWidth(PIEngine pIEngine);
EXPORT int HC_IMG_GetImageHeight(PIEngine pIEngine);
EXPORT int HC_IMG_GetImageComponent(PIEngine pIEngine);
EXPORT int HC_IMG_IsGrayImage(PIEngine pIEngine);


// TODO: image processing. eg. rotate

// scale image into destination thumb (now support zoom out)
EXPORT int HC_IMG_Scale(char *filenameSrc, char *filenameDst, int widthDst, int heightDst);
EXPORT int HC_IMG_GetProperty(PIEngine pIEngine, char *filename);

#ifdef __cplusplus
}
#endif


#endif // __HC_IMAGE_API_H__